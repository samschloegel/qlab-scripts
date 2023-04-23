-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230423-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	try
		set newPrefix to display dialog "Prefix?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of newPrefix is "Cancel" then return
		set newPrefix to text returned of newPrefix
		--
		set startNum to display dialog "Starting number?" default answer "1" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of startNum is "Cancel" then return
		set startNum to (text returned of startNum as integer)
		--
		set increment to display dialog "Increment by..." default answer "1" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of increment is "Cancel" then return
		set increment to (text returned of increment as integer)
		--
		set newSuffix to display dialog "Suffix?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of newSuffix is "Cancel" then return
		set newSuffix to text returned of newSuffix
	on error
		display alert "Script cancelled"
		return
	end try
	
	repeat with eachCue in theSelection
		set q name of eachCue to (newPrefix & startNum & newSuffix)
		set startNum to (startNum + increment)
	end repeat
end tell