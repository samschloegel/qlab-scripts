-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250107-01

set userColor to "Purple"
set userPrefix to "sd"
set userCueName to "DiGiCo Snapshot "
set userNameParent to true

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set userInput to display dialog "Snapshot?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theSnapshot to text returned of userInput
		if button returned of userInput is not "Continue" then return
		
		make type "Start"
		set theStart to last item of (selected as list)
		
		
		set cue target of theStart to cue (userPrefix & theSnapshot)
		set q color of theStart to userColor
		
		make type "Group"
		set theGroup to last item of (selected as list)
		set q name of theGroup to userCueName & theSnapshot
		set q color of theGroup to userColor
		
		move cue id (uniqueID of theStart) of parent of theStart to end of cue id (uniqueID of theGroup)
		
		set theParent to parent of theGroup
		
		if userNameParent and q type of theParent is "Group" then
			set parentName to q name of theParent
			set q name of theParent to parentName & " | Desk Cue " & theSnapshot
			if q color of theParent is "None" then set q color of theParent to userColor
		end if
		
		
	on error
		return
	end try
end tell