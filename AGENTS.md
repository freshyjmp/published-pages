# Published Pages

This repository serves small, standalone pages through one Coolify application.

## Targets

- `sites/jonp.dev/<slug>/index.html` → `https://pages.jonp.dev/<slug>/`
- `sites/illustrious.dev/<slug>/index.html` → `https://pages.illustrious.dev/<slug>/`

## Page contract

- Use a lowercase kebab-case slug that describes the content.
- Put each page and its assets in its own slug directory.
- Prefer a self-contained `index.html`; add local assets only when they materially improve the page.
- Use relative asset URLs so the page works under its slug path.
- Do not add a JavaScript framework or repository-wide build step for a single page.
- Do not overwrite an existing slug unless the user explicitly asks to update that page.
- Never publish secrets, credentials, private customer data, or internal-only material.
- Make permanent pages responsive, keyboard accessible, and usable with reduced motion.

## Social cards

- Use `social-card.html` as the reproducible source and render it at exactly `1200×628` CSS pixels with device scale factor `1`.
- Capture the viewport as `social-card.png`; keep essential text and marks at least `68px` from every edge.
- Store both files beside the page and serve the image from the same public slug. Do not add external object storage for a page-local card.
- Add Open Graph and `twitter:card=summary_large_image` metadata with an absolute image URL, explicit dimensions, and useful alt text.
- Verify the PNG is exactly `1200×628`, under `5 MB`, publicly fetchable, and represented by the deployed metadata.

## Verification

Before pushing, build the container and exercise the page through Nginx with the intended `Host` header. After deployment, open the public URL at desktop and narrow mobile widths and verify the rendered surface.
