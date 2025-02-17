-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250207-01

set userPrefix to "sd"
set userCueName to "SD Snapshot "
set userShowMIDIInfo to true
set userCount to 400 -- The number of snapshot triggers to generate. Do not set above 400.


tell application id "com.figure53.QLab.5" to tell front workspace
	set i to 1
	set scene to 1
	
	repeat userCount times
		make type "MIDI"
		set newCue to last item of (selected as list)
		
		set q number of newCue to userPrefix & (scene)
		
		set command of newCue to control_change
		
		if i is less than 100 then
			set byteOne to 16
			set byteTwo to i
		else if i is less than 200 then
			set byteOne to 17
			set byteTwo to (i - 100)
		else if i is less than 300 then
			set byteOne to 18
			set byteTwo to (i - 200)
		else
			set byteOne to 19
			set byteTwo to (i - 300)
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