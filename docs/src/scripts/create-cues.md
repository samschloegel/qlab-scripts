# Create Cues

## Fades for Selected Cues

::: tip USER PARAMETERS

`userDuration` is the duration in seconds of the generated fade cues

:::

<<< @/../../scripts v5/Create Fades/Create fades for selected.applescript{4}

## Fade-and-Stops for Selected Cues

::: tip USER PARAMETERS

`userDuration` is the duration in seconds of the generated fade cues

:::

<<< @/../../scripts v5/Create Fades/Create fade-and-stops for selected.applescript{4}

## OSC Trigger for Cue X

This is an edge-use thing and only useful if you need QLab to trigger itself via OSC for some particular reason.

> **Example:**
>
> LX is triggering some (but not all) QLab cues, in a way that forces the QLab user to conform to the LX cue numbering. All cues in the Main cue stack are given a prefix or suffix to avoid unintended triggers from LX. All LX-triggered QLab cues live in a dedicated cue list, and this script is used to generate the contents of that cue list quickly, without the user needing to type the prefix or suffix each time they add a cue to the stack.

::: tip USER PARAMETERS

`userPatch` is the OSC output patch name of the generated cues

`userPrefix` is the cue number prefix, if needed (edge use case)

`userSuffix` is the cue number suffix, if needed (edge use case)

:::

<<< @/../../scripts v5/Create Triggers/Create OSC trigger for cue x.applescript

## OSC Triggers for Selected Cues

Creates a group of network cues which target the selected cues

::: tip USER PARAMETERS

`userPatch` is the network patch name which points back to the local instance of QLab (typically localhost:53000)

:::

<<< @/../../scripts v5/Create Triggers/Create OSC triggers for selected.applescript{4}

## Start Cues Targeting Selected Cues

Creates a group of Start cues which target the selected cues

<<< @/../../scripts v5/Create Triggers/Create Start triggers for selected.applescript
