-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set versionLength to 2 -- How many digits for versioning? v1 / v01
-- Do not use slashes in your filenames

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	
	set theFolder to the POSIX path of (choose folder with prompt "lead me to your files")
	
	repeat with eachCue in theSelection
		if q type of eachCue is "Audio" then
			set theName to q name of eachCue
			-- Get POSIX path of current target		
			set theTarget to (file target of eachCue)
			set theTarget to the POSIX path of theTarget
			set reversed to reverse of characters of theTarget as string
			set fileName to text (1 - (offset of "/" in reversed)) thru -1 of theTarget
			set newTarget to theFolder & fileName
			set file target of eachCue to (POSIX file newTarget)
		end if
	end repeat
	
end tell

