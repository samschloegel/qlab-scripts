# Arming

## Arm

Arms selected cues

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set armed of eachCue to true
	end repeat
end tell
```

## Disarm

Disarms selected cues

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set armed of eachCue to false
	end repeat
end tell
```

## Toggle Armed State

Toggles the armed state of selected cues. Evaluates state cue-by-cue.

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		set armed of eachCue to not armed of eachCue
	end repeat
end tell
```
