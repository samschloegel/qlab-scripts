# Stem File Versioning

## Reveal File Target

This will reveal the file target of the last selected Audio cue in the Finder. QLab also provides a built-in tool for this in **Tools > Reveal target file in Finder** but it does not have an associated hotkey

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

You have a group of audio cues, which are stems for a piece of music. The filenames all end in "v03" or something similar. You just bounced new stem files called "v04" but you don't want to tediously manually re-target them all. No one wants to hold for sound. Use this script instead! All the "v04" files must be located in the same folder as the "v03" files.

::: tip USER PARAMETERS

`versionLength` is the number of digits used for version numbers. 2 is recommended: v1 / v01

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set versionLength to 2

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

Similar situation to the above, but you like to organize your stem versions into their own folders.

Keep the filenames of the audio files identical (no "vXX" at the end) but put them into separate folders (maybe call the folder "Stems v03" or something like that).

This script will ask you to select the folder of updated stem files, and then re-targets your audio cues to the files in that folder. This way, you don't lose the integrated fade envelope and other cue settings you've already built, but can batch re-target all your stems quickly and save tedious busy-work.

::: tip USER PARAMETERS

`versionLength` is the number of digits used for version numbers. 2 is recommended: v1 / v01

:::

::: warning

Do not use slashes in your filenames. This script uses 'POSIX' /paths/to/files so adding slashes to the file names will break the current version of this script.

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set versionLength to 2

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
