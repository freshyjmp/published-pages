#!/usr/bin/env bash
set -euo pipefail

VAULT_NAME="${1:-Agent Automation}"
ITEM_TITLE="${2:-example-app/example-service/dev}"
ENVIRONMENT="${3:-dev}"

if [[ ! "$ITEM_TITLE" =~ ^[a-z0-9][a-z0-9-]*/[a-z0-9][a-z0-9-]*/(dev|staging|prod)$ ]]; then
  printf 'Item title must use project/service/environment (dev, staging, or prod).\n' >&2
  exit 2
fi

ITEM_ENVIRONMENT="${ITEM_TITLE##*/}"
if [[ "$ENVIRONMENT" != "$ITEM_ENVIRONMENT" ]]; then
  printf 'Environment argument must match the final item-title segment (%s).\n' "$ITEM_ENVIRONMENT" >&2
  exit 2
fi

for command_name in op jq; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    printf 'Missing required command: %s\n' "$command_name" >&2
    exit 1
  fi
done

if [[ -z "${OP_SERVICE_ACCOUNT_TOKEN:-}" ]]; then
  printf 'OP_SERVICE_ACCOUNT_TOKEN is not set. Load it into this shell, then retry.\n' >&2
  exit 1
fi

if [[ -n "${OP_CONNECT_HOST:-}" || -n "${OP_CONNECT_TOKEN:-}" ]]; then
  printf 'Unset OP_CONNECT_HOST and OP_CONNECT_TOKEN; they override service-account auth.\n' >&2
  exit 1
fi

op user get --me >/dev/null

if ! op vault get "$VAULT_NAME" >/dev/null 2>&1; then
  printf 'The service account cannot access vault %q.\n' "$VAULT_NAME" >&2
  printf 'Create the vault and a new service account with read/write access to it.\n' >&2
  exit 1
fi

template_file="$(mktemp)"
secret_file="$(mktemp)"
cleanup() {
  rm -f "$template_file" "$secret_file"
}
trap cleanup EXIT
chmod 600 "$template_file" "$secret_file"

printf 'Secret value (input hidden): ' >&2
IFS= read -r -s secret_value
printf '\n' >&2
printf '%s' "$secret_value" > "$secret_file"
unset secret_value

op item template get 'API Credential' > "$template_file"

jq \
  --arg title "$ITEM_TITLE" \
  --arg environment "$ENVIRONMENT" \
  --rawfile secret "$secret_file" \
  '.title = $title
   | .tags = ["agent-safe", ("env:" + $environment)]
   | (.fields[] | select(.id == "credential").value) = $secret' \
  "$template_file" \
  | op item create --vault "$VAULT_NAME" - >/dev/null

printf 'Created: op://%s/%s/credential\n' "$VAULT_NAME" "$ITEM_TITLE"
printf 'Test without revealing it: op read %q >/dev/null\n' "op://$VAULT_NAME/$ITEM_TITLE/credential"
