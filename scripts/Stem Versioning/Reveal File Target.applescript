tell application id "com.figure53.QLab.4" to tell front workspace
	set theCue to last item of (selected as list)
	if q type of theCue is "Audio" then
		set fileTarget to file target of theCue
		tell application "Finder"
			reveal fileTarget
			activate
		end tell
	end if
end tell