-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is "Group" then
			set theChildren to (every cue in eachCue)
			set childColors to {"none"}
			repeat with eachChild in theChildren
				if childColors does not contain q color of eachChild then
					set end of childColors to q color of eachChild
				end if
			end repeat
			if (count childColors) = 2 then
				set q color of eachCue to item 2 of childColors
			end if
		end if
	end repeat
end tell