-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

tell application id "com.figure53.QLab.4" to tell front workspace
	set myCue to last item of (selected as list)
	set myID to uniqueID of myCue
	display alert "The Unique ID of \"" & q name of myCue & "\" (" & myID & ") has been copied to the clipboard."
	set the clipboard to myID
end tell