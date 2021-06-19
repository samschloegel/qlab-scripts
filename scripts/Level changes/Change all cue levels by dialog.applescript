-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

set defaultChange to "-2"
set minLevel to -100

tell application id "com.figure53.QLab.4" to tell front workspace
	try
		set theCue to last item of (selected as list)
		if q type of theCue is in {"Audio", "Fade", "Mic"} then
			set userInput to display dialog "How much?" default answer defaultChange buttons {"Cancel", "Continue"} default button "Continue"
			set userIncrement to text returned of userInput
			if button returned of userInput is "Continue" then
				set theGangs to {}
				repeat with i from 1 to 64
					set currentLevel to theCue getLevel row 0 column i
					set thisGang to getGang theCue row 0 column i
					if (currentLevel > minLevel) and (thisGang is not in theGangs) then
						theCue setLevel row 0 column i db currentLevel + userIncrement
						if thisGang is not missing value then
							set end of theGangs to thisGang
						end if
					end if
				end repeat
			end if
		end if
	on error
		return
	end try
end tell