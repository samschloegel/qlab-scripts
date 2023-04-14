-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v230414-01

set outputCount to 16

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Fade"} then
			repeat with i from 0 to outputCount
				setGang eachCue row 0 column i gang ""
			end repeat
		end if
	end repeat
end tell