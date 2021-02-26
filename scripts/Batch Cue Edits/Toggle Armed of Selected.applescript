tell application id "com.figure53.qlab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set armed of eachCue to not armed of eachCue
	end repeat
end tell