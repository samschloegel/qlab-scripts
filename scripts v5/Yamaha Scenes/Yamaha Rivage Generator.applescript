-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v231012-01

set userPrefix to "y"
set userNamePrefix to "Rivage Scene"
set showMIDIInfo to true
set totalSceneCount to 300

tell application id "com.figure53.QLab.5" to tell front workspace
	set i to 0
	set scene to 1
	repeat totalSceneCount times
		make type "MIDI"
		set newCue to last item of (selected as list)
		
		set q number of newCue to userPrefix & scene
		
		set command of newCue to program_change
		
		if i is less than 100 then
			set theChannel to 1
			set byteOne to i
		else if i is less than 200 then
			set theChannel to 2
			set byteOne to (i - 100)
		else if i is less than 300 then
			set theChannel to 3
			set byteOne to (i - 200)
		else if i is less than 400 then
			set theChannel to 4
			set byteOne to (i - 300)
		else if i is less than 500 then
			set theChannel to 5
			set byteOne to (i - 400)
		else if i is less than 600 then
			set theChannel to 6
			set byteOne to (i - 500)
		else if i is less than 700 then
			set theChannel to 7
			set byteOne to (i - 600)
		else if i is less than 800 then
			set theChannel to 8
			set byteOne to (i - 700)
		else if i is less than 900 then
			set theChannel to 9
			set byteOne to (i - 800)
		else if i is less than 1000 then
			set theChannel to 10
			set byteOne to (i - 900)
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