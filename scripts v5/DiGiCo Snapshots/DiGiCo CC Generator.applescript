-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set userPrefix to "sd"
set userCueName to "SD Snapshot "
set userShowMIDIInfo to true
set userCount to 118 -- The number of snapshot triggers to generate. Do not set above 384.


tell application id "com.figure53.QLab.5" to tell front workspace
	set i to 1
	set scene to 1
	
	repeat userCount times
		make type "MIDI"
		set newCue to last item of (selected as list)
		
		set q number of newCue to userPrefix & (scene)
		
		set command of newCue to control_change
		
		if i is less than 129 then
			set byteOne to 16
			set byteTwo to i
		else if i is less than 257 then
			set byteOne to 17
			set byteTwo to (i - 128)
		else
			set byteOne to 18
			set byteTwo to (i - 256)
		end if
		
		set channel of newCue to 16
		set byte one of newCue to byteOne
		set byte two of newCue to byteTwo
		
		
		if userShowMIDIInfo then
			set q name of newCue to userCueName & (scene) & " (Ch 16 / CC " & byteOne & " - " & byteTwo & ")"
		else
			set q name of newCue to userCueName & (scene)
		end if
		
		set i to i + 1
		set scene to scene + 1
	end repeat
	
end tell