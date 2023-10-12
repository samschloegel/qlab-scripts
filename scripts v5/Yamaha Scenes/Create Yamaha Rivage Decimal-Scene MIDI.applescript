-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v231012-01

set userPrefix to "y"
set userNamePrefix to "Rivage Scene"
set showMIDIInfo to true

tell application id "com.figure53.QLab.5" to tell front workspace
	try
		-- Get Scene number
		set inputSceneNumber to display dialog "Scene?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of inputSceneNumber is not "Continue" or text returned of inputSceneNumber is "" then return "Cancelled"
		set theScene to (text returned of inputSceneNumber as number)
		if theScene > 1000 then error "Scene number " & theScene & " is over 1000"
		
		-- Get Channel number		
		set inputChannel to display dialog "Channel?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of inputChannel is not "Continue" or text returned of inputChannel is "" then return "Cancelled"
		set theChannel to (text returned of inputChannel as number)
		if theChannel > 16 then error "Channel number " & theChannel & " is over 16"
		
		-- Get Program number		
		set inputProgram to display dialog "Program Number?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		if button returned of inputProgram is not "Continue" or text returned of inputProgram is "" then return "Cancelled"
		set theProgram to (text returned of inputProgram as number)
		if theProgram > 128 then error "Program number " & theProgram & " is over 128"
		
		-- Off by one (QLab is 0-127, Yamaha is 1-128)		
		set byteOne to (theProgram - 1)
		
		-- Build the MIDI cue
		make type "MIDI"
		set newMIDI to last item of (selected as list)
		set q number of newMIDI to userPrefix & theScene
		set command of newMIDI to program_change
		set channel of newMIDI to theChannel
		set byte one of newMIDI to byteOne
		if showMIDIInfo then
			set q name of newMIDI to userNamePrefix & " " & theScene & " (Ch " & theChannel & " / PC " & byteOne & ")"
		else
			set q name of newMIDI to userNamePrefix & theScene
		end if
	on error errorMsg number errorNum
		display dialog ("User entry error: " & errorMsg)
		return "Error " & errorNum & " " & errorMsg
	end try
end tell