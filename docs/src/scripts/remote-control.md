# Remote Control of macOS

## How to use

These scripts use 'eppc' address, with the format:

`eppc://username:password@Hostname.local`

You will need to replace the `username`, `password`, and `Hostname` portions of these addresses in each script according to your needs.

## App Launch

::: tip USER PARAMETERS

Replace the name of the app to meet your needs.

:::

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

::: tip USER PARAMETERS

Replace the name and path of the files to meet your needs.

:::

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
