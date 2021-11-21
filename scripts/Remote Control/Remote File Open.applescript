-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 4. v211121-01

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