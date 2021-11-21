-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

set userPreRoll to 0.0

tell application id "com.figure53.QLab.4" to tell front workspace
	set theCue to last item of (selected as list)
	set thePre to pre wait of theCue
	set theParent to parent of theCue
	load theParent time (thePre - userPreRoll)
	set playback position of parent list of theParent to cue id (uniqueID of theParent)
end tell