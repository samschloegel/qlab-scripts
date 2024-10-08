# Miscellaneous

## Add go to next cue to groups

A weird fix for a weird cueing workflow. If you're using MIDI triggers that are specific to each cue fired, but still want selective advance-playhead control, this might be for you.

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is "Group" and q type of (parent of eachCue) is "Cue List" and (q number of eachCue is not "") then
			set selected to eachCue
			make type "GoTo"
			set theGoTo to last item of (selected as list)
			moveSelectionDown
			set theTarget to last item of (selected as list)
			if theTarget is theGoTo then
				delete cue id (uniqueID of theGoTo) of parent of theGoTo
			else
				set cue target of theGoTo to theTarget
				move cue id (uniqueID of theGoTo) of parent of theGoTo to beginning of eachCue
			end if
		end if
		set selected to eachCue
	end repeat
end tell
```

## Complete Selected

That one long cue takes forever, you're in tech, and you need the cue to complete in order to get in place to continue. This script loads the selected cue to 99.9% complete, and then fires it. Let's move on.

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theCue to last item of (selected as list)
	set theDuration to duration of theCue
	load theCue time (theDuration * 0.999)
	start theCue
end tell
```

## Copy uniqueID of Selected

Copies the uniqueID of the selected cue to the clipboard. If multiple cues are selected, only copies the ID of the last one.

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

set userAlert to false

tell application id "com.figure53.QLab.5" to tell front workspace
	set myCue to last item of (selected as list)
	set myID to uniqueID of myCue
	if userAlert then display alert "The Unique ID of \"" & q name of myCue & "\" (" & myID & ") has been copied to the clipboard."
	set the clipboard to myID
end tell
```

## DS100 Speaker Check Builder

Builds a cue list for checking individual outputs of a DS100, based on a CSV file, using OSC. Further description/explanation to come. Feel free to try it out in the meantime, but maybe not in your show file the first time.

```applescript{4-6}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v231012-01

set userPreWait to 0.1
set userPatchName to "DS100"
set userMuteCueNumber to "muteall"


set DELIM to {","}
set L1 to {} -- column 1 items
set L2 to {} -- column 2 items

set Lx to {L1, L2}

set aCSV to (choose file)

set csvList to read aCSV using delimiter linefeed
set {TID, AppleScript's text item delimiters} to {AppleScript's text item delimiters, DELIM}

repeat with aRow in csvList
	set rowItems to text items of aRow
	repeat with i from 1 to (count of rowItems)
		copy (item i of rowItems) to the end of (item i of Lx)
	end repeat
end repeat
set AppleScript's text item delimiters to TID

tell application id "com.figure53.QLab.5" to tell front workspace
	repeat with i from 1 to (count of L1)

		make type "Group"
		set theGroup to last item of (selected as list)
		set q name of theGroup to (item i of L1) & " " & (item i of L2)

		make type "Start"
		set theStart to last item of (selected as list)
		set cue target of theStart to cue (userMuteCueNumber)

		make type "Network"
		set theNetwork to last item of (selected as list)
		set network patch name of theNetwork to userPatchName
		set theMessage to "/dbaudio1/matrixoutput/mute/" & i & " 0"
		set custom string of theNetwork to theMessage
		set pre wait of theNetwork to userPreWait

		move cue id (uniqueID of theStart) of parent of theStart to end of cue id (uniqueID of theGroup)
		move cue id (uniqueID of theNetwork) of parent of theNetwork to end of cue id (uniqueID of theGroup)
	end repeat


	return
end tell
```

## Group Selected Individually

Encapsulate each selected cue within its own group.

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set selected to eachCue
		set theName to q name of eachCue
		set theNum to q number of eachCue
		set theID to uniqueID of eachCue
		set q number of eachCue to ""
		make type "Group"
		set theGroup to last item of (selected as list)
		set q name of theGroup to theName
		set q number of theGroup to theNum
		move cue id theID of parent of eachCue to end of theGroup
	end repeat
end tell
```

## Group Selected, Inherit Name

Puts selected cues in a group together.

Why use this instead of the New Group Cue hotkey? Because it works even if there is only one cue selected - and in that case, it will copy the cue's name to the group's name.

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	if (count theSelection) is 0 then return
	set groupName to q name of last item of (selected as list)
	make type "Group"
	set groupCue to last item of (selected as list)
	if (count theSelection) is 1 then -- if only one cue was selected, name the group after it
		set q name of groupCue to groupName
	end if
	set parentOfGroup to parent of groupCue
	repeat with eachCue in theSelection
		if contents of eachCue is not parentOfGroup then -- Avoids a potential selection error
			move cue id (uniqueID of eachCue) of parent of eachCue to end of groupCue
		end if
	end repeat

end tell
```

## Load Parent Group to Start of Selected Child

You have a big, long-running timeline group. You're in tech and need to start from the beginning of the fourth child in the timeline. Select that child cue, and run this script using a hotkey. It will put you in the right place.

::: tip USER PARAMETERS

`userPreRoll` is the number of seconds prior to the start of the selected child at which to begin playback.

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userPreRoll to 0.0

tell application id "com.figure53.QLab.5" to tell front workspace
	set theCue to last item of (selected as list)
	set thePre to pre wait of theCue
	set theParent to parent of theCue
	load theParent time (thePre - userPreRoll)
	set playback position of parent list of theParent to cue id (uniqueID of theParent)
end tell
```

## Move to Cut List

You need to delete some old cues and clean up your main cue list, but you think some of these might come back in the future, and you don't want to lose your work. Use this script to clean up without deleting.

The selected cues are moved to the 'cut cues' list you've chosen. They are then Disabled, and their hotkey, MIDI, timecode, and wall clock triggers are turned off.

::: tip USER PARAMETERS

`cutListName` is the name of your "cut cues" cue list.

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set cutListName to "Cut Cues"

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	try
		set cutList to first cue list whose q display name is cutListName
	on error
		return
	end try
	repeat with eachCue in theSelection
		if q number of eachCue is not "" then
			set q name of eachCue to ("(" & q number of eachCue & ") " & q list name of eachCue)
			set q number of eachCue to ""
		end if

		set cueID to uniqueID of eachCue
		set midi trigger of eachCue to disabled
		set hotkey trigger of eachCue to disabled
		set timecode trigger of eachCue to disabled
		set wall clock trigger of eachCue to disabled
		set armed of eachCue to false
		if parent list of eachCue is not cutList then
			move cue id cueID of parent of eachCue to beginning of cutList
		end if
	end repeat
end tell
```

## "Undo Go"

You hit 'GO' too soon and you're panicking. But don't panic all those cues that were already running! Just assign this as a hotkey near your panic button to only stop the cues from the most recently-triggered sequence.

::: warning

This could have some weird, unintended consequences, and is completely context-dependent. Only use if you know what you're doing.

:::

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	movePlayheadUpASequence
	set theSelection to (selected as list)
	stop theSelection
end tell
```

## Which Cues Use Output X?

This will comb through the selected cues to look for ones that use a given cue output that you're wondering about, then tell you how many cues use it, and select only those cues.

This might help answer questions like:

- Wow, did the sound designer really need and use ALL these cue outputs?
- Oh no, I need another cue output - but I've already maxed out my interface channels! But wait - did I even use that one output? Maybe I can re-allocate it.

::: tip USER PARAMETERS

`userThresh` should be set to match the value in Workspace Settings > Audio > Volume Limits > Min. This is the level at or below which cue levels will be considered '-inf'.

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userThresh to -100

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set theList to {}
	set theOut to (display dialog "Which cue output?" default answer "1" buttons {"Cancel", "Go"} default button "Go")

	if button returned of theOut is "Go" and text returned of theOut is not "" then
		set theOut to (text returned of theOut as integer)
		repeat with eachCue in theSelection
			if q type of eachCue is in {"Audio", "Fade", "Mic"} and ((getLevel eachCue row 0 column theOut) > userThresh) then
				set end of theList to eachCue
			end if
		end repeat
		set selected to theList
		display alert ((length of theList as string) & " of " & (length of theSelection as string) & " cues were found and selected")

	end if
end tell
```

## Set Trigger from Cue Number

If you are using unique MIDI triggers from your console to fire each QLab cue, this script will use the cue number to determine a unique MIDI Note On trigger as follows:

Cue XX.YY

MIDI Note On, Note XX, Velocity YY

::: warning Errors

This script is not very error-proof.

The exact formatting of your cue numbers needs to be numbers only, with or without one decimal point, and within `0-127` ranges to be MIDI-compatible... etc....

:::

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v240915-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set allDigits to every character of "1234567890"

	repeat with eachCue in theSelection
		set qNum to q number of eachCue
		if qNum is "" then
			set midi trigger of eachCue to disabled
			set midi command of eachCue to note_on
			set midi byte one of eachCue to 0
			set midi byte two of eachCue to 0
		else if ¬
			text 1 of qNum is in allDigits and ¬
			text -1 of qNum is in allDigits then
			if qNum does not contain "." then
				set theNote to text 1 thru -1 of qNum
				set theVel to "0"
			else if text 2 of qNum is "." then
				set theNote to text 1 of qNum
				set theVel to text 3 thru -1 of qNum
			else if text 3 of qNum is "." then
				set theNote to text 1 thru 2 of qNum
				set theVel to text 4 thru -1 of qNum
			else if text 4 of qNum is "." then
				set theNote to text 1 thru 3 of qNum
				set theVel to text 5 thru -1 of qNum
			else if qNum does not contain "." then
				set theNote to text 1 thru -1 of qNum
				set theVel to "0"
			end if

			if length of theVel is 1 then
				set theVel to theVel & "0"
			end if

			if length of theVel is greater than 2 then
				error
			end if

			set midi trigger of eachCue to enabled
			set midi command of eachCue to note_on
			set midi byte one of eachCue to theNote
			set midi byte two of eachCue to theVel
		end if
	end repeat

end tell
```
