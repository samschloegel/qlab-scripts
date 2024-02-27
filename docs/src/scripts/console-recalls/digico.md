# Console Recalls

## How to use

These scripts operate together as a set.

::: info IMPORTANT
**DiGiCo SD Theatre consoles do not have a default MIDI-to-snapshot routing map out of the box.**

This set of scripts assumes a MIDI routing scheme where:

- Snapshots are numbered `XX.YY`
- Related MIDI triggers are Control Changes with Control Number `XX` and Control Value `YY`

You do not have to stick to this scheme in an absolute manner - just as a starting point for generating triggers. The generated trigger list can be altered and supplemented manually after initial creation.

:::

1. Run the "list generator" script (preferably from [Script Editor](/guide/#using-macos-script-editor)) in a new empty "Console Cues" cue list
1. Add the "Add Snapshot to Cue List" scripts to your "Hotkeys" cue list
1. In your Main cue list, use the hotkey scripts to add console recalls to your show

## DiGiCo Control-Change List Generator

::: tip USER PARAMETERS
`userPrefix` is a cue-number prefix for the generated MIDI cues and should not be left blank

`userNamePrefix` is a cue-name prefix for the generated MIDI cues

`showMIDIInfo` is a boolean which toggles including the MIDI details in the cue names of the generated cues

`userCount` is the number of snapshot triggers you need to generate. The current version of this script does not work with a value above 384.

:::

```applescript{4-7}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userPrefix to "sd"
set userCueName to "SD Snapshot "
set userShowMIDIInfo to true
set userCount to 118 -- The number of snapshot triggers to generate. Do not set above 384.


tell application id "com.figure53.QLab.5" to tell front workspace
	set i to 1
	set scene to 1

	repeat userCount times
		make type "MIDI"
		set newCue to last item of (selected as list)

		set q number of newCue to userPrefix & (scene)

		set command of newCue to control_change

		if i is less than 129 then
			set byteOne to 16
			set byteTwo to i
		else if i is less than 257 then
			set byteOne to 17
			set byteTwo to (i - 128)
		else
			set byteOne to 18
			set byteTwo to (i - 256)
		end if

		set channel of newCue to 16
		set byte one of newCue to byteOne
		set byte two of newCue to byteTwo


		if userShowMIDIInfo then
			set q name of newCue to userCueName & (scene) & " (Ch 16 / CC " & byteOne & " - " & byteTwo & ")"
		else
			set q name of newCue to userCueName & (scene)
		end if

		set i to i + 1
		set scene to scene + 1
	end repeat

end tell
```

## Add Snapshot to Cue List

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userColor to "Purple"
set userPrefix to "sd"

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "Snapshot?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theSnapshot to text returned of userInput
		if button returned of userInput is "Continue" then
			make type "Start"
			set theStart to last item of (selected as list)
			set cue target of theStart to cue (userPrefix & theSnapshot)
			set q color of theStart to userColor
		end if
	on error
		return
	end try
end tell
```

## Add Snapshot Group to Cue List

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userColor to "Purple"
set userPrefix to "sd"
set userCueName to "DiGiCo Snapshot "

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "Snapshot?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theSnapshot to text returned of userInput
		if button returned of userInput is "Continue" then
			make type "Start"
			set theStart to last item of (selected as list)
			set cue target of theStart to cue (userPrefix & theSnapshot)
			set q color of theStart to userColor
			make type "Group"
			set theGroup to last item of (selected as list)
			set q name of theGroup to userCueName & theSnapshot
			set q color of theGroup to userColor
			move cue id (uniqueID of theStart) of parent of theStart to cue id (uniqueID of theGroup)
		end if
	on error
		return
	end try
end tell
```
