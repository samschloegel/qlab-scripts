-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userDecrement to 2 -- enter your desired decrement here

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Fade", "Mic"} then
			set currentLevel to eachCue getLevel row 0 column 0
			set newLevel to currentLevel - userDecrement
			eachCue setLevel row 0 column 0 db newLevel
		end if
	end repeat
end tell