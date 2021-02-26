set userNumPrefix to "y"
set userNamePrefix to "Yamaha Scene"
set userColor to "Purple"

tell application id "com.figure53.QLab.4" to tell front workspace
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