# Yamaha Console Recalls

## How to use

These scripts operate together as a set.

1. Choose the appropriate "list generator" script for your console - CL Series or Rivage
1. Run the "list generator" script (preferably from [Script Editor](/guide/#using-macos-script-editor)) in a new empty "Console Cues" cue list
1. Add the "Add Scene to Cue List" scripts to your "Hotkeys" cue list
1. In your Main cue list, use the hotkey scripts to add console recalls to your show

## CL Series List Generator

This generates a cue list based on the default MIDI mapping for CL consoles. These have a fixed Program Change to Scene Recall map which is very laborious to edit or replace, so this simply follows that existing format so you don't have to think about it.

::: tip USER PARAMETERS
`userPrefix` is a cue-number prefix for the generated MIDI cues and should not be left blank

`userNamePrefix` is a cue-name prefix for the generated MIDI cues

`showMIDIInfo` is a boolean which toggles including the MIDI details in the cue names of the generated cues

:::

<<< @/../../scripts v5/Yamaha Scenes/Yamaha CL Generator.applescript

## Rivage PM Series List Generator

<<< @/../../scripts v5/Yamaha Scenes/Yamaha Rivage Generator.applescript

### Rivage PM Series Single Decimal-Cue Generator

For manually adding point-cues to the console cues list

::: details Code
<<< @/../../scripts v5/Yamaha Scenes/Create Yamaha Rivage Decimal-Scene MIDI.applescript
:::

## Add Scene to Cue List

<<< @/../../scripts v5/Yamaha Scenes/Create Yamaha Scene.applescript

## Add Scene Group to Cue List

<<< @/../../scripts v5/Yamaha Scenes/Create Yamaha Scene Group.applescript
