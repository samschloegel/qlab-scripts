-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250217-02

set userColor to "Purple"
set userPrefix to "sd"
set userCueName to "Desk Cue"
set userNameParent to true

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		
		set theSelection to first item of (selected as list)
		
		set userInput to display dialog "Snapshot?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theSnapshot to text returned of userInput
		if button returned of userInput is not "Continue" then return
		
		make type "Start"
		set theStart to last item of (selected as list)
		set theParent to parent of theStart
		set cue target of theStart to cue (userPrefix & theSnapshot)
		set q color of theStart to userColor
		
		if q type of theSelection is "Group" and q type of parent of theSelection is "Cue List" then
			move cue id (uniqueID of theStart) to beginning of cue id (uniqueID of theSelection) of parent of theSelection
			if userNameParent then
				set parentName to q name of theSelection
				set q name of theSelection to parentName & " | " & userCueName & " " & theSnapshot
				if q color of theSelection is "None" then set q color of theSelection to userColor
			end if
			set selected to theSelection
			
		end if
		
		if userNameParent and q type of theParent is "Group" then
			set parentName to q name of theParent
			set q name of theParent to parentName & " | " & userCueName & " " & theSnapshot
			if q color of theParent is "None" then set q color of theParent to userColor
		end if
		
	on error
		return
	end try
end tell