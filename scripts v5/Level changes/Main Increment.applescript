-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

set userIncrement to 2 -- enter your desired increment here

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Fade", "Mic"} then
			set currentLevel to eachCue getLevel row 0 column 0
			set newLevel to currentLevel + userIncrement
			eachCue setLevel row 0 column 0 db newLevel
		end if
	end repeat
end tell