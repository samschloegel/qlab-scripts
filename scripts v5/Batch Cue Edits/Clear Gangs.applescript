-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set outputCount to 16

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		repeat with i from 0 to outputCount
			setGang eachCue row 0 column i gang ""
		end repeat
	end repeat
end tell