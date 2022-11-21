-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v221121-01

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	
	repeat with eachCue in theSelection
		
		if q type of eachCue is "Audio" then
			
			-- Row 1
			setLevel eachCue row 1 column 1 db 0.0
			setLevel eachCue row 1 column 2 db -100
			setLevel eachCue row 1 column 3 db 0.0
			setLevel eachCue row 1 column 4 db -100
			setLevel eachCue row 1 column 5 db 0.0
			setLevel eachCue row 1 column 6 db -100
			setLevel eachCue row 1 column 7 db 0.0
			setLevel eachCue row 1 column 8 db -100
			setLevel eachCue row 1 column 9 db 0.0
			setLevel eachCue row 1 column 10 db -100
			setLevel eachCue row 1 column 11 db -6
			setLevel eachCue row 1 column 12 db -6
			setLevel eachCue row 1 column 13 db -6
			setLevel eachCue row 1 column 14 db -6
			setLevel eachCue row 1 column 15 db -6
			setLevel eachCue row 1 column 16 db -6
			setLevel eachCue row 1 column 17 db -6
			setLevel eachCue row 1 column 18 db -6
			setLevel eachCue row 1 column 19 db -6
			setLevel eachCue row 1 column 20 db -6
			setLevel eachCue row 1 column 21 db -6
			setLevel eachCue row 1 column 22 db -6
			setLevel eachCue row 1 column 23 db -6
			setLevel eachCue row 1 column 24 db -6
			setLevel eachCue row 1 column 25 db 0.0
			setLevel eachCue row 1 column 26 db -100
			setLevel eachCue row 1 column 27 db 0.0
			setLevel eachCue row 1 column 28 db -100
			setLevel eachCue row 1 column 29 db -6
			setLevel eachCue row 1 column 30 db -6
			setLevel eachCue row 1 column 31 db -6
			setLevel eachCue row 1 column 32 db -6
			
			-- Row 2
			setLevel eachCue row 2 column 1 db -100
			setLevel eachCue row 2 column 2 db 0.0
			setLevel eachCue row 2 column 3 db -100
			setLevel eachCue row 2 column 4 db 0.0
			setLevel eachCue row 2 column 5 db -100
			setLevel eachCue row 2 column 6 db 0.0
			setLevel eachCue row 2 column 7 db -100
			setLevel eachCue row 2 column 8 db 0.0
			setLevel eachCue row 2 column 9 db -100
			setLevel eachCue row 2 column 10 db 0.0
			setLevel eachCue row 2 column 11 db -6
			setLevel eachCue row 2 column 12 db -6
			setLevel eachCue row 2 column 13 db -6
			setLevel eachCue row 2 column 14 db -6
			setLevel eachCue row 2 column 15 db -6
			setLevel eachCue row 2 column 16 db -6
			setLevel eachCue row 2 column 17 db -6
			setLevel eachCue row 2 column 18 db -6
			setLevel eachCue row 2 column 19 db -6
			setLevel eachCue row 2 column 20 db -6
			setLevel eachCue row 2 column 21 db -6
			setLevel eachCue row 2 column 22 db -6
			setLevel eachCue row 2 column 23 db -6
			setLevel eachCue row 2 column 24 db -6
			setLevel eachCue row 2 column 25 db -100
			setLevel eachCue row 2 column 26 db 0.0
			setLevel eachCue row 2 column 27 db -100
			setLevel eachCue row 2 column 28 db 0.0
			setLevel eachCue row 2 column 29 db -6
			setLevel eachCue row 2 column 30 db -6
			setLevel eachCue row 2 column 31 db -6
			setLevel eachCue row 2 column 32 db -6
			
		end if
		
	end repeat
	
end tell