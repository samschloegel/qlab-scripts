# Miscellaneous

## Add go to next cue to groups

A weird fix for a weird cueing workflow. If you're using MIDI triggers that are specific to each cue fired, but still want selective advance-playhead control, this might be for you.

<<< @/../../scripts v5/Add Go To Next Cue to groups.applescript

## Complete Selected

That one long cue takes forever, you're in tech, and you need the cue to complete in order to get in place to continue. This script loads the selected cue to 99.9% complete, and then fires it. Let's move on.

<<< @/../../scripts v5/Complete selected.applescript

## Copy uniqueID of Selected

Copies the uniqueID of the selected cue to the clipboard. If multiple cues are selected, only copies the ID of the last one.

<<< @/../../scripts v5/Copy uniqueID of selected.applescript{4}

## DS100 Speaker Check Builder

Builds a cue list for checking individual outputs of a DS100, based on a CSV file, using OSC. Further description/explanation to come. Feel free to try it out in the meantime, but maybe not in your show file the first time.

<<< @/../../scripts v5/DS100 Speaker Check Builder.applescript{4-6}

## Group Selected Individually

Encapsulate each selected cue within its own group.

<<< @/../../scripts v5/Group selected individually.applescript

## Group Selected, Inherit Name

Puts selected cues in a group together.

Why use this instead of the New Group Cue hotkey? Because it works even if there is only one cue selected - and in that case, it will copy the cue's name to the group's name.

<<< @/../../scripts v5/Group selected, inherit name.applescript

## Load Parent Group to Start of Selected Child

You have a big, long-running timeline group. You're in tech and need to start from the beginning of the fourth child in the timeline. Select that child cue, and run this script using a hotkey. It will put you in the right place.

::: tip USER PARAMETERS

`userPreRoll` is the number of seconds prior to the start of the selected child at which to begin playback.

:::

<<< @/../../scripts v5/Load Parent Group to start of selected Child.applescript{4}

## Move to Cut List

You need to delete some old cues and clean up your main cue list, but you think some of these might come back in the future, and you don't want to lose your work. Use this script to clean up without deleting.

The selected cues are moved to the 'cut cues' list you've chosen. They are then Disabled, and their hotkey, MIDI, timecode, and wall clock triggers are turned off.

::: tip USER PARAMETERS

`cutListName` is the name of your "cut cues" cue list.

:::

<<< @/../../scripts v5/Move to cut list.applescript{4}

## "Undo Go"

You hit 'GO' too soon and you're panicking. But don't panic all those cues that were already running! Just assign this as a hotkey near your panic button to only stop the cues from the most recently-triggered sequence.

::: warning

This could have some weird, unintended consequences, and is completely context-dependent. Only use if you know what you're doing.

:::

<<< @/../../scripts v5/Undo Go.applescript

## Which Cues Use Output X?

This will comb through the selected cues to look for ones that use a given cue output that you're wondering about, then tell you how many cues use it, and select only those cues.

This might help answer questions like:

- Wow, did the sound designer really need and use ALL these cue outputs?
- Oh no, I need another cue output - but I've already maxed out my interface channels! But wait - did I even use that one output? Maybe I can re-allocate it.

::: tip USER PARAMETERS

`userThresh` should be set to match the value in Workspace Settings > Audio > Volume Limits > Min. This is the level at or below which cue levels will be considered '-inf'.

:::

<<< @/../../scripts v5/Which cues use output x.applescript

## Set Trigger from Cue Number

If you are using unique MIDI triggers from your console to fire each QLab cue, this script will use the cue number to determine a unique MIDI Note On trigger as follows:

Cue XX.YY

MIDI Note On, Note XX, Velocity YY

::: warning Errors

This script is not very error-proof.

The exact formatting of your cue numbers needs to be numbers only, with or without one decimal point, and within `0-127` ranges to be MIDI-compatible... etc....

:::

<<< @/../../scripts v5/Set trigger from cue number.applescript
