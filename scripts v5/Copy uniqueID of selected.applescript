-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250327-01

set userAlert to true
set userDelimiter to "
"

tell application id "com.figure53.QLab.5" to tell front workspace
	set theCount to count of selected
	set theCues to {}
	
	if theCount is 0 then
		set end of theCues to current cue list
	else
		set theCues to (selected as list)
	end if
	
	set theIDs to ""
	repeat with eachCue in theCues
		if length of theIDs is not 0 then
			set theIDs to theIDs & userDelimiter
		end if
		set theIDs to theIDs & uniqueID of eachCue
	end repeat
	
	set the clipboard to theIDs
	if userAlert then display alert "Copied " & theCount & " items"
	
end tell