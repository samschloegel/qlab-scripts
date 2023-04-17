-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userPatch to "This QLab"
set userPrefix to ""
set userSuffix to "."

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