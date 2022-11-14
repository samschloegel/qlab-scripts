-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v221114-01

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	set theColors to {"none", "red", "orange", "green", "blue", "purple"}
	try
		set newColor to choose from list theColors with title "Pick a color" default items {"none"}
		repeat with eachCue in theSelection
			set q color of eachCue to newColor
		end repeat
		
	on error
		return
	end try
end tell