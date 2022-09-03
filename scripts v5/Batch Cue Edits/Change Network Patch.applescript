-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v220903-01

set networkPatchQty to 2

tell application id "com.figure53.QLab.5" to tell front workspace
	
	set listNetwork to {}
	repeat with i from 1 to networkPatchQty
		set end of listNetwork to (i as string)
	end repeat
	
	set theSelection to (selected as list)
	set typeList to {}
	repeat with eachCue in theSelection
		set eachType to q type of eachCue
		if eachType is not in typeList then
			set typeList to typeList & eachType
		end if
	end repeat
	
	if length of typeList is not 1 then
		display alert "Select only Network cues"
		return
	end if
	
	if typeList contains "Network" then
		choose from list listNetwork with title "Select the patch"
		set userPatch to (result as string)
	else
		display alert "Select only Network cues"
	end if
	
	if userPatch is not "false" then
		repeat with eachCue in theSelection
			if q type of eachCue is "Network" then
				set network patch number of eachCue to (userPatch as integer)
			end if
		end repeat
	end if
end tell