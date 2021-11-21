-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userDuration to 5 -- your preferred default fade duration

tell application id "com.figure53.QLab.4" to tell front workspace
	set newCues to {}
	set theSelection to (selected as list)
	repeat with originalCue in theSelection
		set selected to originalCue
		set originalCueType to q type of originalCue
		if originalCueType is in {"Audio", "Video", "Mic", "Fade"} then
			set originalLevel to originalCue getLevel row 0 column 0
			make type "Fade"
			set theFade to last item of (selected as list)
			set duration of theFade to userDuration
			if originalCueType is in {"Audio", "Video", "Mic"} then
				set cue target of theFade to originalCue
				theFade setLevel row 0 column 0 db originalLevel
			else if originalCueType is "Group" then
				set cue target of theFade to originalCue
				theFade setLevel row 0 column 0 db 0
			else if originalCueType is "Fade" then
				set cue target of theFade to (cue target of originalCue)
				theFade setLevel row 0 column 0 db originalLevel
			end if
			set end of newCues to theFade
		end if
	end repeat
	set selected to newCues
end tell