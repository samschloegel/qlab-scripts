-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userPatch to 1
set userPrefix to ""
set userSuffix to "."

tell application id "com.figure53.QLab.4" to tell front workspace
	try
		set userInput to display dialog "QLab Cue?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set cueNumber to text returned of userInput
		if button returned of userInput is "Continue" then
			make type "Network"
			set theNetwork to last item of (selected as list)
			set patch of theNetwork to userPatch
			set osc message type of theNetwork to custom
			set custom message of theNetwork to ("/cue/" & userPrefix & cueNumber & userSuffix & "/go")
		end if
	on error
		return
	end try
end tell