-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250228-01

set userLevel to -6 -- New level
set userRow to 1 -- Audio file channel
set userColumn to 1 -- Cue output

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is "Audio" then
			eachCue setLevel row userRow column userColumn db userLevel
		end if
	end repeat
end tell