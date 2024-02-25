# Stem File Versioning

## Reveal File Target

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

tell application id "com.figure53.QLab.5" to tell front workspace
	set theCue to last item of (selected as list)
	if q type of theCue is "Audio" then
		set fileTarget to file target of theCue
		tell application "Finder"
			reveal fileTarget
			activate
		end tell
	end if
end tell
```

## Bump Version by File Name

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set versionLength to 2 -- How many digits for versioning? v1 / v01, 2 digits recommended

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)
	repeat with eachCue in theSelection
		if q type of eachCue is "Audio" then
			set theName to q name of eachCue
			-- Get POSIX path of current target
			set theTarget to (file target of eachCue)
			set theTarget to the POSIX path of theTarget

			set lastChars to text -6 thru -1 of theTarget
			set thePos to ((6 - ((offset of "." in lastChars) - 2)) * -1)
			set theExt to text (offset of "." in lastChars) thru -1 of lastChars
			set theTrunk to text 1 thru thePos of theTarget
			set oldVersion to (text (versionLength * -1) thru -1 of theTrunk) as integer
			set newVersion to (oldVersion + 1) as string
			if (count newVersion) < versionLength then
				set leadingNeeded to versionLength - (count newVersion)
				repeat leadingNeeded times
					set newVersion to ("0" & newVersion)
				end repeat
			end if
			set newTarget to ((text 1 thru (-1 - versionLength) of theTrunk) & newVersion & theExt)

			set file target of eachCue to (POSIX file newTarget)
		end if
	end repeat

end tell


```

## Bump Version by Folder

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set versionLength to 2 -- How many digits for versioning? v1 / v01
-- Do not use slashes in your filenames

tell application id "com.figure53.QLab.5" to tell front workspace
	set theSelection to (selected as list)

	set theFolder to the POSIX path of (choose folder with prompt "lead me to your files")

	repeat with eachCue in theSelection
		if q type of eachCue is "Audio" then
			set theName to q name of eachCue
			-- Get POSIX path of current target
			set theTarget to (file target of eachCue)
			set theTarget to the POSIX path of theTarget
			set reversed to reverse of characters of theTarget as string
			set fileName to text (1 - (offset of "/" in reversed)) thru -1 of theTarget
			set newTarget to theFolder & fileName
			set file target of eachCue to (POSIX file newTarget)
		end if
	end repeat

end tell
```
