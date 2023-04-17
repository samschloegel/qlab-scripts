-- For help, bug reports, or feature suggestions, please visit https://github.com/samschloegel/qlab-scripts
-- Built for QLab 5. v230416-01

tell application id "com.figure53.QLab.5"
	if midi input enabled of overrides is true then
		set midi input enabled of overrides to false
		set overrides visibility of overrides to false
	else if midi input enabled of overrides is false then
		set midi input enabled of overrides to true
		set overrides visibility of overrides to false
	end if
end tell