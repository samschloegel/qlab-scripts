-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250204-01

set userListNumber to 1
set userDevID to 1
set userColor to "Red"

tell application id "com.figure53.QLab.5" to tell front workspace
	set userInput to display dialog "Cue Number?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
	set theNumber to text returned of userInput
	if button returned of userInput is "Cancel" then return
	
	make type "MIDI"
	set newCue to last item of (selected as list)
	
	set message type of newCue to msc
	set deviceID of newCue to userDevID
	set q_list of newCue to userListNumber
	if theNumber is not "" then
		set q_number of newCue to theNumber
		
		set q name of newCue to ("LX " & userListNumber & "/" & theNumber)
		
		set q color of newCue to userColor
	end if
	
end tell