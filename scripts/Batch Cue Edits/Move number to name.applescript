tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q number of eachCue is not "" then
			set q name of eachCue to ((q number of eachCue) & " " & (q list name of eachCue))
		end if
		set q number of eachCue to ""
	end repeat
end tell