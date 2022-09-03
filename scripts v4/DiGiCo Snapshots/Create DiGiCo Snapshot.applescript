-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userColor to "Purple"
set userPrefix to "sd"

tell application id "com.figure53.QLab.4" to tell front workspace
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