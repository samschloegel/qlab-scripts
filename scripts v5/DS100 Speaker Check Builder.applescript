-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v231012-01

set userPreWait to 0.1
set userPatchName to "DS100"
set userMuteCueNumber to "muteall"


set DELIM to {","}
set L1 to {} -- column 1 items
set L2 to {} -- column 2 items

set Lx to {L1, L2}

set aCSV to (choose file)

set csvList to read aCSV using delimiter linefeed
set {TID, AppleScript's text item delimiters} to {AppleScript's text item delimiters, DELIM}

repeat with aRow in csvList
	set rowItems to text items of aRow
	repeat with i from 1 to (count of rowItems)
		copy (item i of rowItems) to the end of (item i of Lx)
	end repeat
end repeat
set AppleScript's text item delimiters to TID

tell application id "com.figure53.QLab.5" to tell front workspace
	repeat with i from 1 to (count of L1)
		
		make type "Group"
		set theGroup to last item of (selected as list)
		set q name of theGroup to (item i of L1) & " " & (item i of L2)
		
		make type "Start"
		set theStart to last item of (selected as list)
		set cue target of theStart to cue (userMuteCueNumber)
		
		make type "Network"
		set theNetwork to last item of (selected as list)
		set network patch name of theNetwork to userPatchName
		set theMessage to "/dbaudio1/matrixoutput/mute/" & i & " 0"
		set custom string of theNetwork to theMessage
		set pre wait of theNetwork to userPreWait
		
		move cue id (uniqueID of theStart) of parent of theStart to end of cue id (uniqueID of theGroup)
		move cue id (uniqueID of theNetwork) of parent of theNetwork to end of cue id (uniqueID of theGroup)
	end repeat
	
	
	return
end tell