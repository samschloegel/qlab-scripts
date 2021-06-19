-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

set userPrefix to "y"
set userNamePrefix to "Yamaha Scene"
set showMIDIInfo to true

tell application id "com.figure53.QLab.4" to tell front workspace
	set i to 0
	set scene to 1
	repeat 300 times
		make type "MIDI"
		set newCue to last item of (selected as list)
		
		set q number of newCue to userPrefix & scene
		
		set command of newCue to program_change
		
		if i is less than 128 then
			set theChannel to 1
			set byteOne to i
		else if i is less than 256 then
			set theChannel to 2
			set byteOne to (i - 128)
		else
			set theChannel to 3
			set byteOne to (i - 256)
		end if
		
		set channel of newCue to theChannel
		set byte one of newCue to byteOne
		
		
		if showMIDIInfo then
			set q name of newCue to userNamePrefix & " " & scene & " (Ch " & theChannel & " / PC " & byteOne & ")"
		else
			set q name of newCue to userNamePrefix & scene
		end if
		
		set i to i + 1
		set scene to scene + 1
	end repeat
end tell