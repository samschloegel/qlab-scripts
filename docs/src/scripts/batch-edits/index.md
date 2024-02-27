# Batch Cue Edits

## How to use batch-editing scripts

1. Copy the script into a Script Cue
1. In the **Triggers** tab of the **Inspector**, set your preferred hotkey or other trigger
1. Select the cues you want to batch-edit
1. Trigger the script cue with your chosen method

## `Template`

To write your own batch-editing scripts, you can start with the following template.

```applescript
tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)

	repeat with eachCue in theSelection
		-- Do something here
	end repeat

end tell
```
