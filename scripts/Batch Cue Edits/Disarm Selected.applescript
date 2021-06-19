-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set armed of eachCue to false
	end repeat
end tell