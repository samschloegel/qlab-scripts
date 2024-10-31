# Stem File Versioning

## Reveal File Target

This will reveal the file target of the last selected Audio cue in the Finder. QLab also provides a built-in tool for this in **Tools > Reveal target file in Finder** but it does not have an associated hotkey

<<< @/../../scripts v5/Stem Versioning/Reveal File Target.applescript

## Bump Version by File Name

You have a group of audio cues, which are stems for a piece of music. The filenames all end in "v03" or something similar. You just bounced new stem files called "v04" but you don't want to tediously manually re-target them all. No one wants to hold for sound. Use this script instead! All the "v04" files must be located in the same folder as the "v03" files.

::: tip USER PARAMETERS

`versionLength` is the number of digits used for version numbers. 2 is recommended: v1 / v01

:::

<<< @/../../scripts v5/Stem Versioning/Target version bump by filename.applescript{4}

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

<<< @/../../scripts v5/Stem Versioning/Target version bump by folder.applescript{4}
