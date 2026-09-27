# Evidence — 2026-09-27 15:36 UTC

## 16:36 UTC: full scene and brush settings

- Completed full paint_root.tscn read. Source tree remains clean. Tool atlas and
  icon remain unchanged; no separate asset license found in demo file inventory.
  Root MIT and original attribution retained; asset authorship not independently
  established. paint_tools.png SHA256:
  e9220296063c5a31abc96592b8f0d6e8a79fdcecda15835e4ca6fc2265cf2c79.
- Added normal-input brush settings coverage. First attempt used keyboard focus
  on HScrollBar, which default accessibility-only focus rejected. Switched test
  to ordinary mouse input without changing production focus policy. Next failure
  was overly strict label formatting: actual label is `Brush size: 38.0px`, not
  `38px`; now checks its numeric content and fixed prefix/suffix.
- paint-settings-label-20260927.log:19/19 pass, exit0, clean. Box/circle selection,
  mouse size increment32→38, label and stored brush shape/size verified. Both
  failed settings logs retained. No production fixes made.
- Pixel appearance, color picker interaction and renderer-dependent export are
  still unverified. Both films remain pending under existing capture constraint.
  Next feasible queue item may proceed; do not retire these unfinished films.

## 16:06 UTC: input harness corrected

- paint-diagnostic log reproduced failure and showed cursor(0,0) on press despite
  intended canvas position. Harness button event omitted global_position, unlike
  its motion event. Setting both coordinates fixes this; no production edit.
  Vector2.INF approximate sentinel comparison was also probed and returns true;
  it was not the cause. Failed baseline/diagnostic logs retained.
- paint-coordinates log7/7 clean. Expanded paint-modes log14/14 clean, exit0:
  pencil, rectangle geometry, circle geometry, eraser command, Undo and Clear,
  Undo after Clear, and outside-start drag all tested through normal input paths.
- These are command-list/geometry checks only; headless did not establish
  actual pixel output or export. Full scene/asset audit remains next; known
  capture constraint and both films still pending.

- Read README, project config and both scripts fully; scene node/connection
  inventory and canvas layout inspected, remaining full scene audit pending.
  No source AGENTS.md found. Copied new sibling; original source preserved.
- Godot4.7.2 headless import and120-frame runtime exit0 clean. Test uses actual
  mouse events and focused-Enter GUI buttons, not direct drawing callbacks.
  paint-input-20260927.log:4/6 pass, exit1. Mouse stroke and rectangle creation
  fail (no brush records); GUI selection and empty-state operations pass. Need
  diagnose mouse coordinates/input state versus viewport stretch before any
  gameplay fix. Do not call drawing behavior verified.
- State checks are not rendered pixel validation. Save/export intentionally not
  invoked: it requires real renderer frame_post_draw and viewport image data.
- Next: check log outcome, circle/eraser/outside-start/Undo-after-Clear cases,
  remaining scene/asset audit. Existing capture constraint persists; no films
  produced, no original assets removed, no human approval claimed.
