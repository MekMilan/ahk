openWith(app, dest)
{
	if (app == "sublimetext")
		run, C:\Software\Sublime Text\sublime_text.exe %A_ScriptDir%\%dest%
	else
		msgBox,, openWith, ERROR this option doenst exists !
	return
}