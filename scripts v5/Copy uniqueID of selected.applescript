-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250321-01

set userAlert to true

tell application id "com.figure53.QLab.5" to tell front workspace
	set theCount to count of selected
	
	if theCount is 0 then
		set theCue to current cue list
	else
		set theCue to last item of (selected as list)
	end if
	
	set theID to uniqueID of theCue
	set the clipboard to theID
	if userAlert then display alert "The Unique ID of " & q number of theCue & " \"" & q name of theCue & "\" (" & theID & ") has been copied to the clipboard."
end tell