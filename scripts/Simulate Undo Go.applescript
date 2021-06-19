-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts

tell application id "com.figure53.QLab.4" to tell front workspace
	movePlayheadUpASequence
	set theSelection to (selected as list)
	stop theSelection
end tell