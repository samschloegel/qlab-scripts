-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

tell application "Finder"
	set desktopXY to items 3 thru 4 of (get bounds of window of desktop)
	set desktopX to item 1 of desktopXY
	set desktopY to item 2 of desktopXY
end tell

tell application id "com.figure53.qlab.4"
	if overrides visibility of overrides is false then
		set overrides visibility of overrides to true
	end if
	set theWindow to (get properties of front window)
	set theX to item 3 of bounds of theWindow
	set theY to item 4 of bounds of theWindow
	set theBounds to (get bounds of front window)
	
end tell

tell application "System Events"
	if (exists of window "Override Controls" of process "QLab") = true then
		set theSize to size of window "Override Controls" of process "QLab"
		set newX to (desktopX - (item 1 of theSize))
		set newY to (desktopY - (item 2 of theSize))
		set position of window "Override Controls" of process "QLab" to {newX, newY}
	end if
end tell

tell application id "com.figure53.qlab.4"
	set item 1 of theBounds to 0
	set item 3 of theBounds to newX
	set bounds of window id (uniqueID of theWindow) to theBounds
end tell