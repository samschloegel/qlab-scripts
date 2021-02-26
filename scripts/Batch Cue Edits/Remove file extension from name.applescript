tell application id "com.figure53.QLab.4" to tell front workspace
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