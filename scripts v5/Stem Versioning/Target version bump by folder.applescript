-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250227-01

-- ALERT: Do not use slashes in your filenames

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	
	-- Request folder
	set theFolder to the POSIX path of (choose folder with prompt "Which folder are the new stems in?")
	
	-- Request old version
	set oldRequest to display dialog "What is the current version number? Include leading zeroes if needed." default answer "01" buttons {"Cancel", "Continue"} default button "Continue"
	set oldVersion to text returned of oldRequest
	if button returned of oldRequest is not "Continue" then return
	set oldVersionLength to count of oldVersion
	
	-- Request new version
	set newRequest to display dialog "What is the new version number? Include leading zeroes if needed." default answer oldVersion buttons {"Cancel", "Continue"} default button "Continue"
	set newVersion to text returned of newRequest
	if button returned of newRequest is not "Continue" then return
	set newVersionLength to count of newVersion
	
	
	repeat with eachCue in theSelection
		
		if q type of eachCue is "Audio" then
			
			set theName to q name of eachCue
			
			-- Get POSIX path of current target		
			set theTarget to (file target of eachCue)
			set originalPath to the POSIX path of theTarget
			
			-- Determine name of file without full path
			set reversedPath to reverse of characters of originalPath as string
			set fileName to text (1 - (offset of "/" in reversedPath)) thru -1 of originalPath -- "bass v02.wav"
			
			-- Break up string components
			set lastChars to text -6 thru -1 of fileName
			set thePos to ((6 - ((offset of "." in lastChars) - 2)) * -1)
			set theExt to text (offset of "." in lastChars) thru -1 of lastChars -- ".wav"
			set theTrunk to text 1 thru thePos of fileName -- "bass v02"
			
			-- Calculate new file name
			set plainTrunk to text 1 thru (-1 - oldVersionLength) of theTrunk
			set newFileName to plainTrunk & newVersion & theExt
			
			-- Calculate new target
			set newTarget to theFolder & newFileName
			
			-- Set new target
			set file target of eachCue to (POSIX file newTarget)
		end if
	end repeat
	
end tell