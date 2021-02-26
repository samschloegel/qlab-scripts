tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	try
		set userInput to display dialog "Name?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theName to text returned of userInput
		if button returned of userInput is "Continue" then
			set theCount to 1
			repeat with eachCue in theSelection
				set q name of eachCue to (theName & " " & theCount)
				set theCount to (theCount + 1)
			end repeat
		end if
	on error
		return
	end try
end tell