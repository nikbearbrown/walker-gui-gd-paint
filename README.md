# Walker — GD Paint

**What this is.** An independent local adaptation of Godot's `gui/gd_paint`
demo: a small image editor with a pencil, an eraser, rectangle and circle
brushes, brush size and shape, brush and background colors, one-level undo,
clear, and save to PNG/WebP/JPEG. It is a tech demo (a small tool), not a game.

**Why it is in Walker.** It is one of the upstream Godot demos Walker has copied
and checked headless; two native 4K Liam films are pending for it. Its exact
purpose inside Walker has not been written down yet (see
`design/decisions.md`, Q-01).

**What was found and verified.** The production change is the title only.
Headless checks of actual mouse-drawn data pass (14 drawing-mode assertions and
19 brush-settings assertions). These are drawing-command state tests, not
verified pixels or exported images.

## How to run

Open `godot/project.godot` in Godot 4.7 (the logs record 4.7.2) and run the main
scene, `paint_root.tscn`.

Controls (mouse; no custom input actions):

- Left panel: pick Pencil, Eraser, Rectangle or Circle; set brush color, brush
  size (scroll bar), brush shape (box or circle) and background color.
- Canvas (white area): hold the left mouse button and drag to draw. A stroke
  that starts outside the canvas does nothing.
- **Undo last stroke** (one level), **Clear picture**, **Save picture** (opens
  a file dialog; save/export has not been verified).

## Design

- [`GDD.md`](GDD.md) — the recovered game design document (identical copy of
  `design/GDD.md`). It was reverse-engineered from the code by Walker's Zelda GDD
  skill in silent mode on 2026-09-27. It describes what exists; it is **not an
  approved design**, and no design gate is signed.
- [`design/DECK.html`](design/DECK.html) — slide version for review.
- [`design/IMPLEMENTATION-MAP.md`](design/IMPLEMENTATION-MAP.md) — every feature
  mapped to its real scenes, scripts and line numbers.
- [`design/decisions.md`](design/decisions.md) — open questions (purpose,
  learning goal, scope, Save on film, tool-atlas authorship, visual QA).

## Source & license

Independent local adaptation of Godot demos gui/gd_paint at
a3b5c113112f77291d5f3d1360f33a882fdc52f7. Original README/assets/UIDs and
root MIT LICENSE.md retained. Production change: title only.

## Status

- Headless import/startup and test_paint.gd check actual mouse-drawn data and
  GUI Undo/rectangle/Clear. These are drawing-command state tests, not verified
  pixels or exported images. Existing capture constraint blocks visible
  recording. Both native 4K Liam films remain pending.
- Expanded paint-modes test passes 14 assertions. Initial failures were
  corrected by supplying global mouse-button coordinates in the harness;
  gameplay unchanged. Circle/eraser/outside-start and Undo-after-Clear state
  checks now included.
- Brush settings expansion passes 19 assertions
  (paint-settings-label-20260927.log), including mouse slider, numeric label,
  and stored box/circle brush settings. Full scene audit complete;
  pixels/export and both films remain unverified.

See FRICTIONAL.md.

Repository: https://github.com/nikbearbrown/walker-gui-gd-paint
