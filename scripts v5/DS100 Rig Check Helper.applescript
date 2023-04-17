-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230414

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set firstCue to first item of theSelection
	if q type of firstCue is not "Network" then return
	set currentNumber to text -4 thru -3 of (custom string of firstCue as string)
	if text 1 of currentNumber is "/" then set currentNumber to text 2 of currentNumber
	try
		repeat with eachCue in theSelection
			if q type of eachCue is not "Network" then error "Non-network cue selected"
			if custom string of eachCue is "" then display alert "Skipping an incompatible cue"
			if custom string of eachCue is not "" then
				set currentNumber to currentNumber + 1
				set theState to text -4 thru -3 of (custom string of eachCue as string)
				if text 1 of theState is "/" then set theState to text 2 of theState
				set theRest to text 1 thru -5 of (custom string of eachCue as string)
				if text -1 of theRest is not "/" then set theRest to (theRest & "/")
				if currentNumber > 64 then return
				set theMessage to theRest & currentNumber & " 0"
				set custom string of eachCue to theMessage
			end if
		end repeat
	on error errorMsg
		display alert ("Error: " & errorMsg)
	end try
end tell