---
name: Illustrious Technical Field Guides
description: Public operational guides that turn secure workflows into visible routes.
colors:
  signal-ink: "#101613"
  station-paper: "#f4f7f5"
  panel-white: "#ffffff"
  route-green: "#2f6f5d"
  transfer-blue: "#365f8d"
  warning-orange: "#9a624f"
  caution-yellow: "#d8c982"
  secondary-ink: "#4b5a53"
  rule-gray: "#cbd5d0"
  header-ink: "#17231e"
  header-copy: "#d9e5df"
  quiet-strip: "#e7ece9"
  notice-rule: "#c7b979"
  notice-surface: "#f6f3df"
  notice-copy: "#735d13"
  code-rule: "#293c33"
  code-divider: "#3c5147"
  code-muted: "#b9cdc3"
  inline-rule: "#becac4"
  inline-surface: "#e9eeeb"
  control-rule: "#789084"
  footer-copy: "#d5e0da"
typography:
  display:
    fontFamily: "Route Display, Arial Narrow, sans-serif"
    fontSize: "clamp(2.35rem, 4vw, 3.6rem)"
    fontWeight: 700
    lineHeight: 0.95
    letterSpacing: "-0.02em"
  body:
    fontFamily: "Guide Text, ui-sans-serif, system-ui, sans-serif"
    fontSize: "1.08rem"
    fontWeight: 400
    lineHeight: 1.62
  label:
    fontFamily: "Route Display, Arial Narrow, sans-serif"
    fontSize: "0.94rem"
    fontWeight: 700
    letterSpacing: "0.035em"
  hero:
    fontFamily: "Route Display, Arial Narrow, sans-serif"
    fontSize: "clamp(3.2rem, 7vw, 5.6rem)"
    fontWeight: 700
    lineHeight: 0.9
    letterSpacing: "-0.025em"
  lead:
    fontFamily: "Guide Text, ui-sans-serif, system-ui, sans-serif"
    fontSize: "clamp(1.08rem, 1.6vw, 1.24rem)"
    fontWeight: 400
    lineHeight: 1.62
  title:
    fontFamily: "Guide Text, ui-sans-serif, system-ui, sans-serif"
    fontSize: "1.3rem"
    fontWeight: 700
    lineHeight: 1.2
  fine:
    fontFamily: "Route Display, Arial Narrow, sans-serif"
    fontSize: "0.8rem"
    fontWeight: 700
    lineHeight: 1.05
  code:
    fontFamily: "ui-monospace, SFMono-Regular, Consolas, monospace"
    fontSize: "0.9rem"
    fontWeight: 400
    lineHeight: 1.65
  social-summary:
    fontFamily: "Guide Text, ui-sans-serif, system-ui, sans-serif"
    fontSize: "27px"
    fontWeight: 400
    lineHeight: 1.28
  social-square-hero:
    fontFamily: "Route Display, Arial Narrow, sans-serif"
    fontSize: "132px"
    fontWeight: 700
    lineHeight: 0.84
    letterSpacing: "-0.025em"
  social-square-summary:
    fontFamily: "Guide Text, ui-sans-serif, system-ui, sans-serif"
    fontSize: "38px"
    fontWeight: 400
    lineHeight: 1.25
spacing:
  compact: "0.75rem"
  standard: "1rem"
  section: "4.5rem"
components:
  action-primary:
    backgroundColor: "{colors.panel-white}"
    textColor: "{colors.signal-ink}"
    padding: "0.55rem 0.9rem"
  action-download:
    backgroundColor: "{colors.signal-ink}"
    textColor: "{colors.panel-white}"
    padding: "0.65rem 1rem"
---

# Design System: Illustrious Technical Field Guides

## Overview

**Creative North Star: “The Visible Route”**

Security and operational setup become a legible sequence rather than a wall of documentation. Wayfinding graphics carry real information: route lines express dependency, stations define ordered boundaries, and transfer colors distinguish changes in responsibility.

This is the default world for technical field guides, not a mandatory skin for every standalone published artifact. A page-specific surface brief may establish a different world when its subject requires one.

**Key Characteristics:**
- Structural color that encodes sequence or state.
- Condensed wayfinding labels paired with highly legible reading text.
- Flat, bordered surfaces with no decorative card grid.
- Code shown as executable evidence, never visual filler.

## Colors

The palette combines cool public-space neutrals with restrained transit signals.

- **Signal Ink** (`#101613`): primary text and code surfaces.
- **Station Paper** (`#f4f7f5`): reading background.
- **Route Green** (`#2f6f5d`): primary path and positive movement.
- **Transfer Blue** (`#365f8d`): secondary route and section boundary.
- **Warning Orange** (`#9a624f`): reserved for a change in security responsibility.
- **Caution Yellow** (`#d8c982`): restrained confirmation and warning state.
- **Rule Gray** (`#cbd5d0`): separators and route-table structure.

**The Structural Color Rule.** A route color must encode sequence, transfer, or warning; it never decorates an otherwise generic container.

## Typography

**Display Font:** Barlow Condensed, self-hosted as Route Display.  
**Body Font:** Atkinson Hyperlegible, self-hosted as Guide Text.  
**Code Font:** platform monospace stack.

Display type behaves like station signage: compressed and direct, with uppercase reserved for labels. Body copy prioritizes character distinction and sustained reading.

## Layout

Pages use a centered container no wider than 1120px, with the primary reading column capped at 1060px. Long-form copy stays near 70 characters. Ordered guidance may use a continuous route: a compact horizontal overview followed by a vertical reading path. Below 760px, multi-column passages collapse, the route narrows, code scrolls inside its own frame, and navigation remains horizontally scrollable.

## Elevation & Depth

The system is flat by default. Depth comes from restrained color fields, hairline borders, and overlapping route geometry rather than shadows.

## Shapes

Primary surfaces use square corners. Circles are reserved for route stops, substeps, and status marks. Rounded rectangles are not a general-purpose container language.

## Components

### Actions

Primary actions use square, 1px bordered fields with at least a 44px target height. Hover replaces the field with Route Green. Keyboard focus uses a visible 3px violet outline outside the control.

### Code blocks

Code uses Signal Ink with pale green-white text, a ruled header, independent horizontal scrolling, and a labeled copy action. Inline code uses a cool neutral field and may wrap anywhere on narrow screens.

### Navigation

Section navigation is sticky, horizontally scrollable on narrow screens, and typeset as station labels. Hover fills the complete stop with Route Green.

### Route

A route is semantic structure. Every stop must correspond to a real ordered boundary, and the line must remain continuous across responsive layouts.

## Do's and Don'ts

### Do:
- **Do** show the complete operational sequence before asking the reader to scroll.
- **Do** pair claims with exact commands, source links, or observable boundaries.
- **Do** self-host the display and reading faces used by permanent guides.

### Don't:
- **Don't** turn instructions into a grid of same-size cards.
- **Don't** use terminal green, monospace, or dark mode as shorthand for technical credibility.
- **Don't** let code, URLs, or secret references force page-level horizontal overflow.

## Agency deployment service surface

`sites/illustrious.dev/agency-devops/index.html` extends this world in Persuade mode. Its companion `launch-plan.html` is Read mode. The client-facing page leads with the agency offer, a three-stage scope/implementation/handoff route, and an email-first action. Service deliverables use ruled rows rather than a card grid.

The surface retains Route Display, Guide Text, Station Paper, Route Green, Transfer Blue and Header Ink. Its desktop container is 1120px; the public plan uses an 800px reading column. Below 760px the service layout becomes a single column, while the form's paired fields also stack.

Page-specific type adjustments are intentional: 1.125rem body copy, 1rem form/helper copy, a desktop hero spanning 3.3–5.6rem, a mobile hero spanning 3.3–5rem, and a 2rem mobile route title. These are local fit adjustments, not changes to the field-guide defaults above.

The brief builder prepares a visible email draft without uploading or storing input. It requires a non-whitespace problem description, encodes the draft in a mailto link, hides stale drafts when inputs change, and offers explicit clipboard-failure recovery. The direct business email remains usable without JavaScript. Do not style this as a submitted lead or imply delivery before the visitor sends an email.

Public content distinguishes an illustrative project scope and a technical-writing sample from customer proof. No testimonials, success metrics, fixed commercial prices, uptime guarantees or availability promises are invented. Prospect records and individual outreach drafts do not belong in this public repository.
