# Miscellaneous

## Add go to next cue to groups

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

```applescript
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

```applescript
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

```applescript
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

```applescript
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

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userThresh to -100 -- Match this value to your workspace settings. Workspace Settings > Audio > Volume Limits > Min

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
