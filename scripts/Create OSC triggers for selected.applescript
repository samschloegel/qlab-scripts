-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

set userPatch to 1

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	set newCues to {}
	repeat with eachCue in theSelection
		set theQ to q number of eachCue
		set selected to eachCue
		if theQ is not "" then
			make type "Network"
			set newCue to last item of (selected as list)
			set patch of newCue to userPatch
			set osc message type of newCue to custom
			set custom message of newCue to ("/cue/" & theQ & "/start")
			set end of newCues to newCue
		end if
	end repeat
	if length of newCues is not 0 then
		make type "Group"
		set theGroup to last item of (selected as list)
		repeat with eachCue in newCues
			move cue id (uniqueID of eachCue) of parent of eachCue to end of theGroup
		end repeat
	end if
end tell