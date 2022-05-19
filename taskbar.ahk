#NoTrayIcon
global clock_location := (A_ScreenWidth-30) 
global taskbar_location := (A_ScreenHeight-12)

gui, -resize -caption +AlwaysOnTop +ToolWindow
gui, Margin, 0, 0
gui, add, text, h12 vcurrentActive w800
gui, add, text, ym, CTRL + SHIFT + 9-0 (hide-show)
gui, add, text, h12 vtaskbar ym, 01/01/0101 | 00:00
gui, show, h12 w%A_ScreenWidth% y%taskbar_location%

GuiControlGet, clock_pos, Pos, taskbar
global result := (A_ScreenWidth-clock_posW-2)

Loop
{
	FormatTime, time_date, , dd/MM/yyyy | hh:mm tt
	GuiControl,, taskbar, %time_date%
	GuiControl, Move, taskbar, x%result%

	winGetTitle, title, a
	GuiControl,, currentActive, %title%
	GuiControlGet, currrent_active_pos, Pos, currentActive
	GuiControl, Move, currentActive, w%currrent_active_posW%
	sleep, 500
}