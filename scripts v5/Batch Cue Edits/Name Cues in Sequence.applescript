-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	try
		set newName to display dialog "Name?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of newName is "Cancel" then return
		set newName to text returned of newName
		--
		set startNum to display dialog "Starting number?" default answer "1" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of startNum is "Cancel" then return
		set startNum to (text returned of startNum as integer)
		--
		set increment to display dialog "Increment by..." default answer "1" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of increment is "Cancel" then return
		set increment to (text returned of increment as integer)
	on error
		display alert "Script cancelled"
		return
	end try
	
	repeat with eachCue in theSelection
		set q name of eachCue to (newName & " " & startNum)
		set startNum to (startNum + increment)
	end repeat
end tell