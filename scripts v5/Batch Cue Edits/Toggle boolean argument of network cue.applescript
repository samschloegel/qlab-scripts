-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		try
			if q type of eachCue is "Network" and custom string of eachCue is not "" then
				set theState to last character of (custom message of eachCue as string)
				set theRest to text 1 thru -2 of (custom message of eachCue as string)
				set theMessage to false
				if theState is "1" then
					set theMessage to theRest & "0"
				else if theState is "0" then
					set theMessage to theRest & "1"
				end if
				if theMessage is not false then
					set custom string of eachCue to theMessage
				end if
			end if
		end try
	end repeat
end tell