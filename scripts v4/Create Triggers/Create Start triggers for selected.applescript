-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userPatch to 1

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	set newCues to {}
	repeat with eachCue in theSelection
		set theQ to q number of eachCue
		set selected to eachCue
		make type "Start"
		set newCue to last item of (selected as list)
		set cue target of newCue to eachCue
		set end of newCues to newCue
	end repeat
	if length of newCues is not 0 then
		make type "Group"
		set theGroup to last item of (selected as list)
		repeat with eachCue in newCues
			move cue id (uniqueID of eachCue) of parent of eachCue to end of theGroup
		end repeat
	end if
end tell