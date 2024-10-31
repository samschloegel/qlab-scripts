# Colors

## Set color from list

Navigating to the color selector of the **Basics** tab is tedious. Instead, add your list of favorite colors here, and then set color from a list without touching the mouse.

<<< @/../../scripts v5/Batch Cue Edits/Set color from list.applescript

## Set group color by child

If the children of the selected groups only contain one color (other than 'none'), set the selected group to that color as well.

Only works on direct children, not grandchildren etc (not recursive).

> **Example:**
> All MIDI triggers to LX are color-coded red. The selected group has an LX trigger in it, and none of the other children have a color set, so the group is set to red as well, indicating that it contains an LX trigger.

<<< @/../../scripts v5/Batch Cue Edits/Set group color by child.applescript
