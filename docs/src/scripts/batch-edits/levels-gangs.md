# Levels & Gangs

## Main Level Increment

::: tip USER PARAMETERS

`userIncrement` is the number of decibels by which the 'Main' level of the selected cues will be incremented

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

set userIncrement to 2 -- enter your desired increment here

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Fade", "Mic"} then
			set currentLevel to eachCue getLevel row 0 column 0
			set newLevel to currentLevel + userIncrement
			eachCue setLevel row 0 column 0 db newLevel
		end if
	end repeat
end tell
```

## Main Level Decrement

::: tip USER PARAMETERS

`userDecrement` is the number of decibels by which the 'Main' level of the selected cues will be decremented

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

set userDecrement to 2 -- enter your desired decrement here

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Fade", "Mic"} then
			set currentLevel to eachCue getLevel row 0 column 0
			set newLevel to currentLevel - userDecrement
			eachCue setLevel row 0 column 0 db newLevel
		end if
	end repeat
end tell
```

## Main Level to 0dB

```applescript
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
```

## Main Level to -inf

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is in {"Audio", "Mic", "Fade", "Video"} then
			eachCue setLevel row 0 column 0 db -120
		end if
	end repeat
end tell
```

## Change all cue levels by dialog

- A dialog asks for an increment value (can be negative, to decrement) and then changes all cue output fader values of a single selected cue by that amount.

- There are probably better ways to accomplish the same goal here, but maybe you're working for someone who wants to do it this way, and this can save you the headache.

::: tip USER PARAMETERS

`defaultChange` is the pre-filled value for the user-input dialog

`minLevel` should be set to match the value in Workspace Settings > Audio > Volume Limits > Min. This is the level at or below which cue levels will be considered '-inf'.

:::

```applescript{4-5}
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
```

## Clear Gangs

::: tip USER PARAMETERS

`outputCount` is the number of cue outputs you are using (or wish to remove gangs from)

:::

```applescript
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
```
