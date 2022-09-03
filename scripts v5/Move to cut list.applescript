-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set cutListName to "Cut Cues"

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	try
		set cutList to first cue list whose q display name is cutListName
	on error
		return
	end try
	repeat with eachCue in theSelection
		if q number of eachCue is not "" then
			set q name of eachCue to ("(" & q number of eachCue & ") " & q list name of eachCue)
			set q number of eachCue to ""
		end if
		
		set cueID to uniqueID of eachCue
		set midi trigger of eachCue to disabled
		set hotkey trigger of eachCue to disabled
		set timecode trigger of eachCue to disabled
		set wall clock trigger of eachCue to disabled
		set armed of eachCue to false
		if parent list of eachCue is not cutList then
			move cue id cueID of parent of eachCue to beginning of cutList
		end if
	end repeat
end tell