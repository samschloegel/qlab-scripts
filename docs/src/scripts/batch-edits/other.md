# Other

## Change Network Patch

Change the patch of selected cues, without touching the mouse.

::: tip USER PARAMETERS

`networkPatchQty` is the integer quantity of network patches used in your workspace

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

set networkPatchQty to 2

tell application id "com.figure53.QLab.5" to tell front workspace

	set listNetwork to {}
	repeat with i from 1 to networkPatchQty
		set end of listNetwork to (i as string)
	end repeat

	set theSelection to (selected as list)
	set typeList to {}
	repeat with eachCue in theSelection
		set eachType to q type of eachCue
		if eachType is not in typeList then
			set typeList to typeList & eachType
		end if
	end repeat

	if length of typeList is not 1 then
		display alert "Select only Network cues"
		return
	end if

	if typeList contains "Network" then
		choose from list listNetwork with title "Select the patch"
		set userPatch to (result as string)
	else
		display alert "Select only Network cues"
	end if

	if userPatch is not "false" then
		repeat with eachCue in theSelection
			if q type of eachCue is "Network" then
				set network patch number of eachCue to (userPatch as integer)
			end if
		end repeat
	end if
end tell
```

## Toggle boolean argument of network cue

If the last character of the custom message of a network cue is 1 or 0, toggle it. This is useful for OSC messages which change mute states or other boolean states.

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		try
			if q type of eachCue is "Network" and custom string of eachCue is not "" then
				set theState to last character of (custom message of eachCue as string)
				set theRest to text 1 thru -2 of (custom message of eachCue as string)
				set theMessage to false
				if theState is "1" then
					set theMessage to theRest & "0"
				else if theState is "0" then
					set theMessage to theRest & "1"
				end if
				if theMessage is not false then
					set custom string of eachCue to theMessage
				end if
			end if
		end try
	end repeat
end tell
```
