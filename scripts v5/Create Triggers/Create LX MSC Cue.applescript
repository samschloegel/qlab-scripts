-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250217-01

set userListNumber to 1
set userDevID to 1
set userColor to "Green"
set userShowListNumber to false
set userNameParent to true

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set theSelection to first item of (selected as list)
		
		set userInput to display dialog "Cue Number?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of userInput is "Cancel" then return
		if text returned of userInput is "" then return
		set theNumber to text returned of userInput
		
		make type "MIDI"
		set newMIDI to last item of (selected as list)
		set theParent to parent of newMIDI
		
		set message type of newMIDI to msc
		set deviceID of newMIDI to userDevID
		set command format of newMIDI to 1
		set q_number of newMIDI to theNumber
		set q_list of newMIDI to userListNumber
		
		set q color of newMIDI to userColor
		set newName to ("LX " & theNumber)
		if userShowListNumber then set newName to ("LX " & userListNumber & "/" & theNumber)
		set q name of newMIDI to newName
		
		if q type of theSelection is "Group" and q type of parent of theSelection is "Cue List" then
			move cue id (uniqueID of newMIDI) to beginning of cue id (uniqueID of theSelection) of parent of theSelection
			if userNameParent then
				set parentName to q name of theSelection
				set q name of theSelection to parentName & " | " & newName
				if q color of theSelection is "None" then set q color of theSelection to userColor
			end if
			set selected to theSelection
		end if
		
		if userNameParent and q type of theParent is "Group" then
			set parentName to q name of theParent
			set q name of theParent to parentName & " | " & newName
			if q color of theParent is "None" then set q color of theParent to userColor
		end if
		
	on error
		return
	end try
end tell