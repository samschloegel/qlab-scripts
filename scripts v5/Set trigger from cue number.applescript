-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v240915-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	set allDigits to every character of "1234567890"
	
	repeat with eachCue in theSelection
		set qNum to q number of eachCue
		if qNum is "" then
			set midi trigger of eachCue to disabled
			set midi command of eachCue to note_on
			set midi byte one of eachCue to 0
			set midi byte two of eachCue to 0
		else if ¬
			text 1 of qNum is in allDigits and ¬
			text -1 of qNum is in allDigits then
			if qNum does not contain "." then
				set theNote to text 1 thru -1 of qNum
				set theVel to "0"
			else if text 2 of qNum is "." then
				set theNote to text 1 of qNum
				set theVel to text 3 thru -1 of qNum
			else if text 3 of qNum is "." then
				set theNote to text 1 thru 2 of qNum
				set theVel to text 4 thru -1 of qNum
			else if text 4 of qNum is "." then
				set theNote to text 1 thru 3 of qNum
				set theVel to text 5 thru -1 of qNum
			else if qNum does not contain "." then
				set theNote to text 1 thru -1 of qNum
				set theVel to "0"
			end if
			
			if length of theVel is 1 then
				set theVel to theVel & "0"
			end if
			
			if length of theVel is greater than 2 then
				error
			end if
			
			set midi trigger of eachCue to enabled
			set midi command of eachCue to note_on
			set midi byte one of eachCue to theNote
			set midi byte two of eachCue to theVel
		end if
	end repeat
	
end tell