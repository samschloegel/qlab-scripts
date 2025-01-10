# Console Recalls

## How to use

These scripts operate together as a set.

::: info IMPORTANT
**DiGiCo SD Theatre consoles do not have a default MIDI-to-snapshot routing map out of the box.**

This set of scripts assumes a MIDI routing scheme where:

- Snapshots are numbered `XX.YY`
- Related MIDI triggers are Control Changes with Control Number `XX` and Control Value `YY`

You do not have to stick to this scheme in an absolute manner - just as a starting point for generating triggers. The generated trigger list can be altered and supplemented manually after initial creation.

:::

1. Run the "list generator" script (preferably from [Script Editor](/guide/#using-macos-script-editor)) in a new empty "Console Cues" cue list
1. Add the "Add Snapshot to Cue List" scripts to your "Hotkeys" cue list
1. In your Main cue list, use the hotkey scripts to add console recalls to your show

## DiGiCo Control-Change List Generator

::: tip USER PARAMETERS
`userPrefix` is a cue-number prefix for the generated MIDI cues and should not be left blank

`userNamePrefix` is a cue-name prefix for the generated MIDI cues

`showMIDIInfo` is a boolean which toggles including the MIDI details in the cue names of the generated cues

`userCount` is the number of snapshot triggers you need to generate. The current version of this script does not work with a value above 384.

:::

<<< @/../../scripts v5/DiGiCo Snapshots/DiGiCo CC Generator.applescript{4-7}

## Add Snapshot to Cue List

::: tip USER PARAMETERS
`userColor` see list generator script above - must match

`userPrefix` see list generator script above - must match

`userNameParent` If set to 'true', the parent group of the newly created cue will be color coded and have a suffix added to indicate the presence of a console cue

:::

<<< @/../../scripts v5/DiGiCo Snapshots/Create DiGiCo Snapshot.applescript

## Add Snapshot Group to Cue List

::: tip USER PARAMETERS
`userColor` see list generator script above - must match

`userPrefix` see list generator script above - must match

`userNameParent` If set to 'true', the parent group of the newly created cue will be color coded and have a suffix added to indicate the presence of a console cue

:::

<<< @/../../scripts v5/DiGiCo Snapshots/Create DiGiCo Snapshot Group.applescript
