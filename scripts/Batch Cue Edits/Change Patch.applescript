-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

set networkPatchQty to 5

tell application id "com.figure53.QLab.4" to tell front workspace
	set errorOccured to false
	set listNetwork to {}
	repeat with i from 1 to networkPatchQty
		set end of listNetwork to (i as string)
	end repeat
	set list8 to {"1", "2", "3", "4", "5", "6", "7", "8"}
	set theSelection to (selected as list)
	set typeList to {}
	repeat with eachCue in theSelection
		set eachType to q type of eachCue
		if eachType is not in typeList then
			set typeList to typeList & eachType
		end if
	end repeat
	
	if length of typeList is not 1 then
		display alert "Select only one type of cue"
		return
	end if
	
	if typeList contains "Network" then
		choose from list listNetwork with title "Select the patch"
		set userPatch to (result as string)
	else
		choose from list list8 with title "Select the patch"
		set userPatch to (result as string)
	end if
	if userPatch is not "false" then
		repeat with eachCue in theSelection
			if q type of eachCue is "Network" then
				set patch of eachCue to (userPatch as integer)
			else if q type of eachCue is in {"Audio", "Mic", "MIDI"} and (userPatch is in list8) then
				set patch of eachCue to (userPatch as integer)
			else
				set errorOccured to true
			end if
			if patch of eachCue is not (userPatch as integer) then
				set errorOccured to true
			end if
		end repeat
	end if
	if errorOccured then
		display alert "Something didn't work"
	end if
end tell