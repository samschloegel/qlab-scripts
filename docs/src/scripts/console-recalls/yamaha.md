# Yamaha Console Recalls

## How to use

These scripts operate together as a set.

1. Choose the appropriate "list generator" script for your console - CL Series or Rivage
1. Run the "list generator" script in a new empty "Console Cues" cue list
1. Add the "Add Scene to Cue List" scripts to your "Hotkeys" cue list
1. In your "Main" show cue list, use the hotkey scripts to add console recalls to your show

## CL-Series List Generator

This generates a cue list based on the default MIDI mapping for CL consoles. These have a fixed Program Change to Scene Recall map which is very laborious to edit or replace, so this simply follows that existing format so you don't have to think about it.

::: info USER PARAMETERS
`userPrefix` is a cue-number prefix for the generated MIDI cues and should not be left blank

`userNamePrefix` is a cue-name prefix for the generated MIDI cues

`showMIDIInfo` is a boolean which toggles including the MIDI details in the cue names of the generated cues

:::

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userPrefix to "y"
set userNamePrefix to "Yamaha Scene"
set showMIDIInfo to true

tell application id "com.figure53.QLab.5" to tell front workspace
	set i to 0
	set scene to 1
	repeat 300 times
		make type "MIDI"
		set newCue to last item of (selected as list)

		set q number of newCue to userPrefix & scene

		set command of newCue to program_change

		if i is less than 128 then
			set theChannel to 1
			set byteOne to i
		else if i is less than 256 then
			set theChannel to 2
			set byteOne to (i - 128)
		else
			set theChannel to 3
			set byteOne to (i - 256)
		end if

		set channel of newCue to theChannel
		set byte one of newCue to byteOne


		if showMIDIInfo then
			set q name of newCue to userNamePrefix & " " & scene & " (Ch " & theChannel & " / PC " & byteOne & ")"
		else
			set q name of newCue to userNamePrefix & scene
		end if

		set i to i + 1
		set scene to scene + 1
	end repeat
end tell
```

## Rivage PM-Series Cue Generator

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v231012-01

set userPrefix to "y"
set userNamePrefix to "Rivage Scene"
set showMIDIInfo to true
set totalSceneCount to 300

tell application id "com.figure53.QLab.5" to tell front workspace
	set i to 0
	set scene to 1
	repeat totalSceneCount times
		make type "MIDI"
		set newCue to last item of (selected as list)

		set q number of newCue to userPrefix & scene

		set command of newCue to program_change

		if i is less than 100 then
			set theChannel to 1
			set byteOne to i
		else if i is less than 200 then
			set theChannel to 2
			set byteOne to (i - 100)
		else if i is less than 300 then
			set theChannel to 3
			set byteOne to (i - 200)
		else if i is less than 400 then
			set theChannel to 4
			set byteOne to (i - 300)
		else if i is less than 500 then
			set theChannel to 5
			set byteOne to (i - 400)
		else if i is less than 600 then
			set theChannel to 6
			set byteOne to (i - 500)
		else if i is less than 700 then
			set theChannel to 7
			set byteOne to (i - 600)
		else if i is less than 800 then
			set theChannel to 8
			set byteOne to (i - 700)
		else if i is less than 900 then
			set theChannel to 9
			set byteOne to (i - 800)
		else if i is less than 1000 then
			set theChannel to 10
			set byteOne to (i - 900)
		end if

		set channel of newCue to theChannel
		set byte one of newCue to byteOne


		if showMIDIInfo then
			set q name of newCue to userNamePrefix & " " & scene & " (Ch " & theChannel & " / PC " & byteOne & ")"
		else
			set q name of newCue to userNamePrefix & scene
		end if

		set i to i + 1
		set scene to scene + 1
	end repeat
end tell
```

## Add Scene to Cue List

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userNumPrefix to "y"
set userNamePrefix to "Yamaha Scene"
set userColor to "Purple"

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "Scene?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theScene to text returned of userInput
		if button returned of userInput is "Continue" and theScene is not "" then
			make type "Start"
			set theStart to last item of (selected as list)
			set cue target of theStart to cue (userNumPrefix & theScene)
			set q color of theStart to userColor
		end if
	on error
		return
	end try
end tell
```

## Add Scene Group to Cue List

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userNumPrefix to "y"
set userNamePrefix to "Yamaha Scene"
set userColor to "Purple"

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "Scene?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theScene to text returned of userInput
		if button returned of userInput is "Continue" and theScene is not "" then
			make type "Start"
			set theStart to last item of (selected as list)
			set cue target of theStart to cue (userNumPrefix & theScene)
			set q color of theStart to userColor
			make type "Group"
			set theGroup to last item of (selected as list)
			set q name of theGroup to userNamePrefix & " " & theScene
			set q color of theGroup to userColor
			move cue id (uniqueID of theStart) of parent of theStart to cue id (uniqueID of theGroup)
		end if
	on error
		return
	end try
end tell
```

##

```applescript

```

##

```applescript

```

##

```applescript

```

##

```applescript

```

##

```applescript

```

##

```applescript

```

##

```applescript

```

##

```applescript

```
