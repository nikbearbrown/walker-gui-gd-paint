# Open questions log — walker-gui-gd-paint

Gate — unsigned at time of writing. Written by `/gdd reverse` (silent), 2026-09-27. Every `[MISSING]` in `GDD.md` is one row here. Format: THE QUESTION / THE STAKES / DECISION DEADLINE / OPTIONS / OWNER / STATUS.

| # | Question | Stakes | Deadline | Options | Owner | Status |
|---|---|---|---|---|---|---|
| Q-01 | Why is a paint demo in Walker? | Without it "done" is undefined; films have no thesis | before the first film script | (a) teach command-list drawing / `_draw()`; (b) teach GUI wiring in code; (c) film subject only | Nik Bear Brown | Open |
| Q-02 | Who is it for? | Narration depth; which quirks to explain | with Q-01 | Godot beginners · Walker students · general viewers | Nik Bear Brown | Open |
| Q-03 | Pillars, or "upstream-faithful, title only" as the rule? | The quirks in §5 will tempt fixes; a rule decides | with Q-01 | upstream-faithful · Walker may extend with logged changes | Nik Bear Brown | Open |
| Q-04 | What should a user know or be able to do after using it? (PX / learning goal) | No goal, no success test | before H-01 | explain why undo is one level · none (pure sample) | Nik Bear Brown | Open |
| Q-05 | Scope beyond upstream: multi-level undo, stroke interpolation, true eraser, circle radius rule? MVP? | Scope creep; CORE % cannot be computed; changing quirks changes what the demo teaches | before any code change | none (today) · pick one · all | Nik Bear Brown | Open |
| Q-06 | Should Save be verified and shown on film, given its filesystem-wide dialog with hidden files? | Privacy exposure in a recording (R-02); save is entirely unverified | before any film showing Save | verify in a scratch session, never on camera · restrict dialog (a Walker change) · omit Save from films | Nik Bear Brown | Open |
| Q-07 | Who authored `paint_tools.png`, and is it covered by the root MIT license? | Redistribution risk (R-04) | before any public release | confirm via upstream history · replace the atlas | Nik Bear Brown | Open |
| Q-08 | Film plan: both native-4K Liam films still wanted? | Pending with no script | when the capture blocker lifts | keep both · one · none | Nik Bear Brown | Open |
| Q-09 | Who checks pixel output and the color pickers, and when? | Command-list passes keep being read as drawing verification (R-01) | before any film | named reviewer + date | Nik Bear Brown | Open |

## Decisions logged

None. Nothing in this folder records an approved design decision.
