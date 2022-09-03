-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

tell application id "com.figure53.QLab.4" to tell front workspace
	set theCue to last item of (selected as list)
	set theDuration to duration of theCue
	load theCue time (theDuration * 0.999)
	start theCue
end tell