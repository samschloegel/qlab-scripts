-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v250310-01

-- This script is dependent on the existence of a network cue with the number "patchEdit" which  targets the local QLab session internally.

set userPatchName to "Audition"
set userCueOutputs to 64 -- The nunber of cue outputs you a using
set userCopy to 2 -- The patch routing column to copy from
set userPaste to 6 -- The patch routing column to paste into

tell application id "com.figure53.QLab.5" to tell front workspace
	set networkCue to (cue "patchEdit")
	repeat with cueOutput from 1 to userCueOutputs
		set custom string of networkCue to ("/settings/audio/patch/" & userPatchName & "/level/" & cueOutput & "/" & userPaste & " #/settings/audio/patch/" & userPatchName & "/level/" & cueOutput & "/" & userCopy & "#")
		start networkCue
	end repeat
end tell