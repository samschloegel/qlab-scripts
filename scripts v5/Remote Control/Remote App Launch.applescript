-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v211121-01

set qlabMain to machine "eppc://username:password@QLab-Main.local"
set qlabBackup to machine "eppc://username:password@QLab-Backup.local"

using terms from application "Finder"
	tell application "Finder" of qlabMain to open ("Applications/SomeApp.app" as POSIX file as alias)
	tell application "Finder" of qlabBackup to open ("Applications/SomeApp.app" as POSIX file as alias)
end using terms from