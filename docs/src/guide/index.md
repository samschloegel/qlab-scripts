# How To

## Using this guide

Script contents appear in a code block, as shown below. You can select and copy the contents, or hover over the top-right corner to find a "Copy" button.

Some scripts have "User Parameters", generally located at the top of the script. User Parameters are explained in a box above the code block, and are highlighted within the code block. For example:

::: tip USER PARAMETERS

`variable_name` explanation

:::

```applescript{4}
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. vYYMMDD-XX

set variable_name to "some value"

tell application id "com.figure53.QLab.5" to tell front workspace
...
end tell
```

## Using Script Cues

Many of the scripts here are best used in a Script Cue, with an assigned hotkey trigger.

1. Create a cue list called "Hotkeys"
1. Create a new Script Cue
1. Inspector > Triggers tab > Enter your preferred hotkey trigger
1. Inspector > Script tab > Paste script in and click "Compile Script"

## Using macOS Script Editor

1. Applications > Utilities > Script Editor > New Script
1. Paste script in and click "Compile" (Cmd-K)
1. Do waht you need to in QLab (such as selecting relevant cues)
1. In Script Editor, click Run (Cmd-R)

## Learning to write your own scripts

I learned to write AppleScript for QLab primarily by trying to use and interpret other people's scripts - which is why I am sharing and documenting my own scripts here. AppleScript is relatively human-readable on its own, which makes it very accessible to inexperienced users.

Here are some useful guides and documentation:

- QLab's official AppleScript dictionary can be found [here](https://qlab.app/docs/v5/scripting/applescript-dictionary-v5/)

- If you have QLab installed, you can access the dictionary with the macOS Script Editor. Go to File > Open Dictionary... > QLab.app

- Apple's AppleScript Language Guide can be found [here](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)
