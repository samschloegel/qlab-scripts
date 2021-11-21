-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userThresh to -100 -- Match this value to your workspace settings. Workspace Settings > Audio > Volume Limits > Min

tell application id "com.figure53.QLab.4" to tell front workspace
	set theSelection to (selected as list)
	set theList to {}
	set theOut to (display dialog "Which cue output?" default answer "1" buttons {"Cancel", "Go"} default button "Go")
	
	if button returned of theOut is "Go" and text returned of theOut is not "" then
		set theOut to (text returned of theOut as integer)
		repeat with eachCue in theSelection
			if q type of eachCue is in {"Audio", "Fade", "Mic"} and ((getLevel eachCue row 0 column theOut) > userThresh) then
				set end of theList to eachCue
			end if
		end repeat
		set selected to theList
		display alert ((length of theList as string) & " of " & (length of theSelection as string) & " cues were found and selected")
		
	end if
end tell