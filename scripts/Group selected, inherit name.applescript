-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v220408-01

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	if (count theSelection) is 0 then return
	set groupName to q display name of last item of (selected as list)
	make type "Group"
	set groupCue to last item of (selected as list)
	if (count theSelection) is 1 then -- if only one cue was selected, name the group after it
		set q name of groupCue to groupName
	end if
	set parentOfGroup to parent of groupCue
	repeat with eachCue in theSelection
		if contents of eachCue is not parentOfGroup then -- Avoids a potential selection error		
			move cue id (uniqueID of eachCue) of parent of eachCue to end of groupCue
		end if
	end repeat
	
end tell