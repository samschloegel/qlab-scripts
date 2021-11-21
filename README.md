# qlab-scripts

Complex [QLab](https://qlab.app/) programming can be made much simpler with the use of Applescript automation. This is a collection of scripts I have found useful in various situations. Some are broadly useful, some are very specific to one particular problem. Some I wrote for myself, some I wrote to make someone else's workflow easier. It's a mixed bag.

Each script can be copy-pasted into a QLab Script Cue, or run from the Script Editor utility included with macOS.

Many of the scripts here are best used in a Script Cue, with an assigned hotkey trigger.

Any questions, suggestions, bug reports, or other feedback - please [submit an issue](https://github.com/samschloegel/qlab-scripts/issues) or [send me an email](mailto:samsdomainaddress@gmail.com)!

Let me know if you get any use out of these, I'd love to hear about it.

Cheers,

Sam

---

Not affiliated with [Figure53](https://figure53.com/). QLab's Applescript documentation can be found [here](https://qlab.app/docs/v4/scripting/applescript-dictionary-v4/).

---

## Batch Cue Edits

### Arm Selected, Disarm Selected, Toggle Armed of Selected

- Self-explanatory, useful on a hotkey

### Change Patch

- Change the patch of selected cues
- Enter the number of network patches used in your workspace into the `networkPatchQty` variable at the top of script.

### Clear Gangs

- Self-explanatory, useful on a hotkey
- Only clears gangs from cue output faders, not from cue output matrix crosspoints

### Move number to name

- Clears the cue number, appends the number to the beginning of the cue name

### Name Cues in Sequence

- Takes a name, starting number, and increment value from the user, then overwrites the cue names of selected cues based on the user's input

### Remove file extension from name

- Does what is says. Won't work for file extension longer than 5 characters.

### Set color from list

- Finding the cue color selector in the inspector can be tedious, especially if you don't spend much time in the Basics tab. Put this script on a hotkey and managing cue colors becomes much faster and easier - don't even move your cursor.

### Set group color by child

- If any children of a group are assigned a color other than "none", make the group that color.
- If the group has children of multiple colors other than "none", do nothing.
- Only works on direct children, not grandchildren etc (not recursive).

### Toggle boolean argument of network cue

- If the last character of the custom message of a network cue is 1 or 0, toggle it. Useful for OSC messages that change mute states or other boolean states.

---

## DiGiCo Snapshots

These three scripts work together as a group. (See below for Yamaha Scenes equivalent.)

There are some variables at the begining which you can alter if you'd like.

- `set userNumPrefix to "sd"` -- Change this if you'd like, but make sure you do it consistently across all scripts in this folder.
- `set userCount` -- input the number of DiGiCo snapshots in your cue list.
- `set userNamePrefix to "SD Snapshot"` -- same notes as above
- `set userColor to "Purple"` -- Use whatever color you prefer for your DiGiCo Snapshot recall cues, but make sure to change it for all scripts in this folder, so they can work well together.

Once you've altered variables (if any):

1. Create a new cue list and run the `DiGiCo CC Generator` script inside it.
1. Back in your main cue list, run either of the other two scripts from a hotkey - whichever better suits your workflow.

---

## Level Changes

### Change all levels by dialog

- A dialog asks for an increment value (can be negative, to decrement) and then changes all cue output fader values of a single selected cue by that amount.
- There are probably better ways to accomplish the same goal here, but maybe you're working for someone who wants to do it this way, and this can save you the headache.

### Master Increment, Decrement, to -inf, to 0dB

- Self-explanatory, useful on a hotkey

---

## Overrides

### OSC Out Enable/Disable

- Basic examples of override toggle syntax. Copy and alter to meet your needs.

### Show overrides, position windows

- Moves the floating overrides window to the corner of the screen and adjusts the workspace window to not overlap it horizontally - a useful alignment tool if you need to keep the overrides window open peristently throughout a show.

---

## Remote Control

- Syntax examples for controlling other Macs, to automate startup and shutdown procedures, etc. Copy and alter to meet your needs.

---

## Stem Versioning

### Reveal File Target

- Very straightforward. You get it.

### Target version bump by filename

- You have a group of audio cues, which are stems for a piece of music. The filenames all end in "v03" or something like that. You just re-exported them all with "v04" but you don't want to manually re-target everything, because it's tedious and no one wants to hold for sound. Use this script instead! As long as you put all the "v04" files into the folder where the "v03" files live, this should save you time.

### Target version bump by folder

- Similar situation to the above, but you like to organize your stem versions into their own folders.
- Keep the filenames identical (no "v03" at the end) but put them into separate folders (maybe call the folder "Stems v03" or something like that).
- This script will ask you to select the folder where the new versions are, and then will re-target your audio cues to the files in that folder. This way, you don't lose the integrated fade envelope and other cue settings you've already built, but can batch re-target all your stems quickly and no one has to hold for sound while you're spending precious time on something tedious. Everyone wins??
- There may be better ways to go about this, but if this is the workflow you know and love, this could save you time.

---

## Yamaha Scenes

These three scripts work together as a group.

There are some variables at the begining which you can alter if you'd like.

- `set userNumPrefix to "y"` -- Change this if you'd like, but make sure you do it consistently across all scripts in this folder.
- `set userNamePrefix to "Yamaha Scene"` -- same notes as above
- `set userColor to "Purple"` -- Use whatever color you prefer for your Yamaha Scene recall cues, but make sure to change it for all scripts in this folder, so they can work well together.

Once you've altered variables (if any):

1. Create a new cue list and run the `Yamaha 300 Generator` script inside it.
1. Back in your main cue list, run either of the other scripts from a hotkey - whichever better suits your workflow.

---

## Other Un-Categorized Scripts

### Add Go To Next Cue to groups

- A weird fix for a weird cueing (sp?) workflow. If you're using MIDI triggers that are specific to each cue fired, but still want selective advance-playhead control, this might be for you. No further comment.

### Complete selected

- That one long cue takes forever, you're in tech, and you need the cue to complete in order to get in place to continue. This script loads the selected cue to 99.9% complete, and then fires it. Let's move on.

### Copy uniqueID of selected

- Copies the uniqueID of the selected cue to the clipboard. If multiple cues are selected, only copies the ID of the last one.

### Create fade-and-stops for selected

- Self-explanatory, useful on a hotkey

### Create fades for selected

- Self-explanatory, useful on a hotkey

### Create OSC trigger for cue x

- Creates a network cue with the custom message "/cue/x/go" where x is the value entered into a dialog by the user
- Before using, define `userPrefix`, `userSuffix`, and `userPatch` variables at the beginning

### Create OSC triggers for selected

- Creates a group of network cues that fire the selected cues

### Create Start triggers for selected

- Same as above but with Start cues instead of Network cues

### Group selected, inherit name

- Puts selected cues in a group together
- Why use this instead of the New Group Cue hotkey? Because it works even if there is only one cue selected - and in that case, it will copy the cue's name to the group's name

### Load Parent Group to start of selected Child

- You have a big, long-running timeline group. You're in tech and need to start from the beginning of the fourth child in the timeline. Select it and run this script using a hotkey. It will put you in the right place.
- There is a `userPreRoll` variable at the beginning - enter the number of seconds prior to the start of the selected child at which to begin playback.

### Move to cut list

- Set the `cutListName` variable to the name of your "cut cues" cue list. Then, instead of _deleting_ cues in your main list, select them and run this script instead.
- The cues are moved the list you've chosen, disabled, and their hotkey, MIDI, timecode, and wall clock triggers are turned off.

### Put selected into individual groups

- Encapsulate each selected cue within its own group.

### Simulate Undo Go

- This one is funny. Use at your own risk - but it might just recover you from a catastrophic mistake.
- All this does it move the playhead up a sequence and stop the cue in that position if it is running.
- This was written for an A1 who had to trigger IEM click tracks from within the main cue list. If the A1 accidentally triggered the click track too early, this enabled a fast recovery with minimal mind-bending distractions to the cast.

### Which cues use output x?

- This will comb through the selected cues to look for ones that use a given cue output that you're wondering about, then tell you how many cues use it, and select only those cues.
- Before using, change the `userThresh` variable at the top of the script to match your setting for Min Volume Limit (Workspace Preferences > Audio > top right section)
- Might help answer questions like:
  - Wow, did the sound designer _really_ need _ALL_ these cue outputs?
  - Oh no, I need another cue output but I've already maxed out my interface channels. But wait, did I even use that one output? Maybe I can re-allocate it.
