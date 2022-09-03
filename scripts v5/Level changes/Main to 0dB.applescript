-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Mic", "Fade", "Video"} then
			eachCue setLevel row 0 column 0 db 0
		end if
	end repeat
end tell