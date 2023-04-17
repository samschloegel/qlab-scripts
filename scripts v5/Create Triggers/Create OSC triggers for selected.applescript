-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

set userPatch to "This QLab"

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set newCues to {}
	repeat with eachCue in theSelection
		set theQ to q number of eachCue
		set selected to eachCue
		if theQ is not "" then
			make type "Network"
			set newCue to last item of (selected as list)
			set network patch name of newCue to userPatch
			set custom string of newCue to ("/cue/" & theQ & "/start")
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