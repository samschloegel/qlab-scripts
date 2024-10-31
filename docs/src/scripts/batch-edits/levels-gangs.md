# Levels & Gangs

## Main Level Increment

::: tip USER PARAMETERS

`userIncrement` is the number of decibels by which the 'Main' level of the selected cues will be incremented

:::

<<< @/../../scripts v5/Level changes/Main Increment.applescript

## Main Level Decrement

::: tip USER PARAMETERS

`userDecrement` is the number of decibels by which the 'Main' level of the selected cues will be decremented

:::

<<< @/../../scripts v5/Level changes/Main Decrement.applescript

## Main Level to 0dB

<<< @/../../scripts v5/Level changes/Main to 0dB.applescript

## Main Level to -inf

<<< @/../../scripts v5/Level changes/Main to -inf.applescript

## Change all cue levels by dialog

- A dialog asks for an increment value (can be negative, to decrement) and then changes all cue output fader values of a single selected cue by that amount.

- There are probably better ways to accomplish the same goal here, but maybe you're working for someone who wants to do it this way, and this can save you the headache.

::: tip USER PARAMETERS

`defaultChange` is the pre-filled value for the user-input dialog

`minLevel` should be set to match the value in Workspace Settings > Audio > Volume Limits > Min. This is the level at or below which cue levels will be considered '-inf'.

:::

<<< @/../../scripts v5/Level changes/Change all cue levels by dialog.applescript {4-5}

## Clear Gangs

::: tip USER PARAMETERS

`outputCount` is the number of cue outputs you are using (or wish to remove gangs from)

:::

<<< @/../../scripts v5/Batch Cue Edits/Clear Gangs.applescript
