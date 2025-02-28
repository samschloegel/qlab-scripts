# Stem File Versioning

## Bump Version by Folder

Keep the filenames of the audio files identical apart from the version number at the end. They can be in separate folders or the same folder.

This script will ask you to select the folder of the new stem files, and request the current and new version numbers. It is important that you enter the correct number of digits, including leading zeroes. "1" will not be treated the same as "01". The old and new version do not need to have the same number of digits; it is possible to update from "01" to "2" or even from "005" to "04".

The script then re-targets your audio cues. This way, you don't lose the integrated fade envelope and other cue settings you've already built, but can batch re-target all your stems quickly and save tedious busy-work.

::: warning
Do not use slashes in your filenames. This script uses 'POSIX' /paths/to/files so adding slashes to the file names will break the current version of this script.
:::

::: warning
Make sure to use the correct number of digits / leading zeroes for both the old version and the new version numbers.
:::

<<< @/../../scripts v5/Stem Versioning/Target version bump by folder.applescript{4}

## Reveal File Target

This will reveal the file target of the last selected Audio cue in the Finder. QLab also provides a built-in tool for this in **Tools > Reveal target file in Finder** but it does not have an associated hotkey.

<<< @/../../scripts v5/Stem Versioning/Reveal File Target.applescript

## Bump Version by File Name

This script is not as good as the one above as it is more restrictive. But feel free to try it if you want....

You have a group of audio cues, which are stems for a piece of music. The filenames all end in "v03" or something similar. You just bounced new stem files called "v04" but you don't want to tediously manually re-target them all. No one wants to hold for sound. Use this script instead! All the "v04" files must be located in the same folder as the "v03" files.

::: tip USER PARAMETERS

`versionLength` is the number of digits used for version numbers. 2 is recommended: v1 / v01

:::

<<< @/../../scripts v5/Stem Versioning/Target version bump by filename.applescript{4}
