# Remote Control of macOS

## App Launch

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set qlabMain to machine "eppc://username:password@QLab-Main.local"
set qlabBackup to machine "eppc://username:password@QLab-Backup.local"

using terms from application "Finder"
	tell application "Finder" of qlabMain to open ("Applications/SomeApp.app" as POSIX file as alias)
	tell application "Finder" of qlabBackup to open ("Applications/SomeApp.app" as POSIX file as alias)
end using terms from
```

## File Open

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set qlabMain to machine "eppc://username:password@QLab-Main.local"
set qlabBackup to machine "eppc://username:password@QLab-Backup.local"

using terms from application "Finder"
	tell application "Finder" of qlabMain
		open POSIX file "/Users/username/someFolder/workspace.qlab4"
	end tell
	tell application "Finder" of qlabBackup
		open POSIX file "/Users/username/someFolder/workspace.qlab4"
	end tell
end using terms from
```

## Shutdown

::: warning
This will shut down your computers **WITHOUT** saving your QLab workspace.
:::

```applescript
-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set qlabMain to machine "eppc://username:password@QLab-Main.local"
set qlabBackup to machine "eppc://username:password@QLab-Backup.local"

using terms from application "QLab 5"
	tell application "QLab" of qlabMain
		quit saving no
	end tell
	tell application "QLab" of qlabBackup
		quit saving no
	end tell
end using terms from

delay 5

using terms from application "Finder"
	tell application "Finder" of qlabMain
		shut down
	end tell
	tell application "Finder" of qlabBackup
		shut down
	end tell
end using terms from
```
