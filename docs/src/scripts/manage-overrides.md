# Manage Overrides

## Toggle MIDI Input

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

tell application id "com.figure53.QLab.5"
	if midi input enabled of overrides is true then
		set midi input enabled of overrides to false
		set overrides visibility of overrides to false
	else if midi input enabled of overrides is false then
		set midi input enabled of overrides to true
		set overrides visibility of overrides to false
	end if
end tell
```

## OSC Output Enable

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

tell application id "com.figure53.QLab.5"
	set network external output enabled of overrides to true
	set overrides visibility of overrides to false
end tell
```

## OSC Output Disable

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

tell application id "com.figure53.QLab.5"
	set network external output enabled of overrides to false
	set overrides visibility of overrides to true
end tell
```

## Show Overrides Window, Position Bottom Right

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application "Finder"
	set desktopX to item 3 of (get bounds of window of desktop)
	set desktopY to item 4 of (get bounds of window of desktop)
end tell

tell application id "com.figure53.QLab.5"
	if overrides visibility of overrides is false then
		set overrides visibility of overrides to true
	end if
	set workspaceWindowProps to (get properties of front window)
	set workspaceBounds to (get bounds of front window)

end tell

tell application "System Events"
	if (exists of window "Override Controls" of process "QLab") = true then
		set theORWindowSize to size of window "Override Controls" of process "QLab"
		set theORWidth to item 1 of theORWindowSize
		set theORHeight to item 2 of theORWindowSize
		set position of window "Override Controls" of process "QLab" to {(desktopX - theORWidth), (desktopY - theORHeight)}
	end if
end tell

tell application id "com.figure53.QLab.5"
	set workspaceBounds to {0, 0, (desktopX - theORWidth), desktopY}
	set bounds of window id (uniqueID of workspaceWindowProps) to workspaceBounds
end tell
```

## Show Overrides Window, Position Top Left

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application "Finder"
	set desktopX to item 3 of (get bounds of window of desktop)
	set desktopY to item 4 of (get bounds of window of desktop)
end tell

tell application id "com.figure53.QLab.5"
	if overrides visibility of overrides is false then
		set overrides visibility of overrides to true
	end if
	set workspaceWindowProps to (get properties of front window)
	set workspaceBounds to (get bounds of front window)

end tell

tell application "System Events"
	if (exists of window "Override Controls" of process "QLab") = true then
		set theORWindowSize to size of window "Override Controls" of process "QLab"
		set theORWidth to item 1 of theORWindowSize
		set theORHeight to item 2 of theORWindowSize
		set position of window "Override Controls" of process "QLab" to {0, 0}
	end if
end tell

tell application id "com.figure53.QLab.5"
	set workspaceBounds to {theORWidth, 0, desktopX, desktopY}
	set bounds of window id (uniqueID of workspaceWindowProps) to workspaceBounds
end tell
```
