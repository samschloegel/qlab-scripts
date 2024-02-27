# Create Cues

## Fades for Selected Cues

::: tip USER PARAMETERS

`userDuration` is the duration in seconds of the generated fade cues

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userDuration to 5

tell application id "com.figure53.QLab.5" to tell front workspace
	set newCues to {}
	set theSelection to (selected as list)
	repeat with originalCue in theSelection
		set selected to originalCue
		set originalCueType to q type of originalCue
		if originalCueType is in {"Audio", "Video", "Mic", "Fade"} then
			set originalLevel to originalCue getLevel row 0 column 0
			make type "Fade"
			set theFade to last item of (selected as list)
			set duration of theFade to userDuration
			if originalCueType is in {"Audio", "Video", "Mic"} then
				set cue target of theFade to originalCue
				theFade setLevel row 0 column 0 db originalLevel
			else if originalCueType is "Group" then
				set cue target of theFade to originalCue
				theFade setLevel row 0 column 0 db 0
			else if originalCueType is "Fade" then
				set cue target of theFade to (cue target of originalCue)
				theFade setLevel row 0 column 0 db originalLevel
			end if
			set end of newCues to theFade
		end if
	end repeat
	set selected to newCues
end tell
```

## Fade-and-Stops for Selected Cues

::: tip USER PARAMETERS

`userDuration` is the duration in seconds of the generated fade cues

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userDuration to 5

tell application id "com.figure53.QLab.5" to tell front workspace
	set newCues to {}
	set theSelection to (selected as list)
	repeat with originalCue in theSelection
		set selected to originalCue
		set originalCueType to q type of originalCue
		if originalCueType is in {"Audio", "Video", "Mic", "Fade"} then
			set originalLevel to originalCue getLevel row 0 column 0
			make type "Fade"
			set theFade to last item of (selected as list)
			set duration of theFade to userDuration
			if originalCueType is in {"Audio", "Video", "Mic"} then
				set cue target of theFade to originalCue
				theFade setLevel row 0 column 0 db originalLevel
			else if originalCueType is "Group" then
				set cue target of theFade to originalCue
				theFade setLevel row 0 column 0 db 0
			else if originalCueType is "Fade" then
				set cue target of theFade to (cue target of originalCue)
				theFade setLevel row 0 column 0 db originalLevel
			end if
			set stop target when done of theFade to 1
			set end of newCues to theFade
		end if
	end repeat
	set selected to newCues
end tell
```

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

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userPatch to "This QLab"
set userPrefix to ""
set userSuffix to ""

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "QLab Cue?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set cueNumber to text returned of userInput
		if button returned of userInput is "Continue" then
			make type "Network"
			set theNetwork to last item of (selected as list)
			set network patch name of theNetwork to userPatch
			set custom string of theNetwork to ("/cue/" & userPrefix & cueNumber & userSuffix & "/go")
		end if
	on error
		return
	end try
end tell
```

## OSC Triggers for Selected Cues

Creates a group of network cues which target the selected cues

::: tip USER PARAMETERS

`userPatch` is the network patch name which points back to the local instance of QLab (typically localhost:53000)

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

set userPatch to "This QLab"

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set newCues to {}
	repeat with eachCue in theSelection
		set theQ to q number of eachCue
		set selected to eachCue
		if theQ is not "" then
			make type "Network"
			set newCue to last item of (selected as list)
			set network patch name of newCue to userPatch
			set custom string of newCue to ("/cue/" & theQ & "/start")
			set end of newCues to newCue
		end if
	end repeat
	if length of newCues is not 0 then
		make type "Group"
		set theGroup to last item of (selected as list)
		repeat with eachCue in newCues
			move cue id (uniqueID of eachCue) of parent of eachCue to end of theGroup
		end repeat
	end if
end tell
```

## Start Cues Targeting Selected Cues

Creates a group of Start cues which target the selected cues

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set newCues to {}
	repeat with eachCue in theSelection
		set theQ to q number of eachCue
		set selected to eachCue
		make type "Start"
		set newCue to last item of (selected as list)
		set cue target of newCue to eachCue
		set end of newCues to newCue
	end repeat
	if length of newCues is not 0 then
		make type "Group"
		set theGroup to last item of (selected as list)
		repeat with eachCue in newCues
			move cue id (uniqueID of eachCue) of parent of eachCue to end of theGroup
		end repeat
	end if
end tell
```
