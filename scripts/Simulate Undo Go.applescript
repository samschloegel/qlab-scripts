-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

tell application id "com.figure53.QLab.4" to tell front workspace
	movePlayheadUpASequence
	set theSelection to (selected as list)
	stop theSelection
end tell