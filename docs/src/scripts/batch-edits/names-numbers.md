# Names & Numbers

## Name in Sequence

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230423-02

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set defaultPrefix to q display name of first item of theSelection
	try
		set newPrefix to display dialog "Prefix?" default answer defaultPrefix buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of newPrefix is "Cancel" then return
		set newPrefix to text returned of newPrefix
		--
		set startNum to display dialog "Starting number?" default answer "1" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of startNum is "Cancel" then return
		set startNum to (text returned of startNum as integer)
		--
		set increment to display dialog "Increment by..." default answer "1" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of increment is "Cancel" then return
		set increment to (text returned of increment as integer)
		--
		set newSuffix to display dialog "Suffix?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of newSuffix is "Cancel" then return
		set newSuffix to text returned of newSuffix
	on error
		display alert "Script cancelled"
		return
	end try

	repeat with eachCue in theSelection
		set q name of eachCue to (newPrefix & startNum & newSuffix)
		set startNum to (startNum + increment)
	end repeat
end tell
```

## Number in Sequence

No script needed! Just use QLab's built-in tools. Go to `Tools > Renumber selected cues...` or press `Cmd-R`

## De-Number, Move to Name

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q number of eachCue is not "" then
			set q name of eachCue to ((q number of eachCue) & " " & (q list name of eachCue))
		end if
		set q number of eachCue to ""
	end repeat
end tell
```

## Remove extension from name

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set errorOccured to false
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		try
			set theName to q name of eachCue
			set lastChars to text -6 thru -1 of theName
			if lastChars contains "." then
				set thePos to ((6 - ((offset of "." in lastChars) - 2)) * -1)
				set newName to text 1 thru thePos of theName
				set q name of eachCue to newName
			end if
		on error
			set errorOccured to true
		end try
	end repeat
	if errorOccured then
		display alert "That may have failed for some of the selected cues, but it probably didn't break anything"
	end if
end tell
```
