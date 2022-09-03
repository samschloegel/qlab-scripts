-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

set defaultChange to "-2"
set minLevel to -100

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set theSelection to (selected as list)
		if length of theSelection is greater than 1 then
			set userConfirmation to display dialog "Multiple cues are selected. Are you sure you want to continue?" buttons {"Stop", "Continue"} default button "Stop"
			if button returned of userConfirmation is "Stop" then
				return
			end if
		end if
		
		set userInput to display dialog "How much?" default answer defaultChange buttons {"Cancel", "Continue"} default button "Continue"
		set userIncrement to text returned of userInput
		
		if button returned of userInput is "Continue" then
			
			repeat with eachCue in theSelection
				if q type of eachCue is in {"Audio", "Fade", "Mic"} then
					set theGangs to {}
					repeat with i from 1 to 64
						set currentLevel to eachCue getLevel row 0 column i
						set thisGang to getGang eachCue row 0 column i
						if (currentLevel > minLevel) and (thisGang is not in theGangs) then
							eachCue setLevel row 0 column i db currentLevel + userIncrement
							if thisGang is not missing value then
								set end of theGangs to thisGang
							end if
						end if
					end repeat
				end if
			end repeat
			
		end if
	on error
		display dialog "There was an error, sorry! Something might have broken along the way."
		return
	end try
end tell