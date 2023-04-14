-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v230414

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	set firstCue to first item of theSelection
	set currentNumber to text -4 thru -3 of (custom message of firstCue as string)
	if text 1 of currentNumber is "/" then set currentNumber to text 2 of currentNumber
	try
		repeat with eachCue in theSelection
			if q type of eachCue is "Network" and osc message type of eachCue is custom and custom message of eachCue is not "" then
				set currentNumber to currentNumber + 1
				set theState to text -4 thru -3 of (custom message of eachCue as string)
				if text 1 of theState is "/" then set theState to text 2 of theState
				set theRest to text 1 thru -5 of (custom message of eachCue as string)
				if text -1 of theRest is not "/" then set theRest to (theRest & "/")
				if currentNumber > 64 then return
				set theMessage to theRest & currentNumber & " 0"
				set custom message of eachCue to theMessage
			end if
		end repeat
	end try
end tell