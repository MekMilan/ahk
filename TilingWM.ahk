#NoTrayIcon
#SingleInstance, force
CoordMode, Pixel, Screen

padding_top 	:= 25
padding_botton 	:= 0
padding_left	:= 0
padding_right	:= 0

; w 14 h 8

^!c::
	winGetTitle, title, a
	CenterWindow(title)
return

^!f::
	winGetTitle, title, a
	WinGet, state, MinMax, % "ahk_id " WinExist(title)
	If (state = 1) ; Maximized
		WinRestore
	winGetPos, x, y, w, h, %title%
	winMove, %title%,, padding_left, padding_top, A_ScreenWidth, (A_ScreenHeight-padding_top-padding_botton)
return

^!d::
	winGetTitle, title, a
	WinMaximize, %title%
return

^!s::
	winGetTitle, title, a
	WinMinimize, %title%
return

^!x::
	winGetTitle, title, a
	winClose, %title%
return

#^!h::
	winGetTitle, title, a
	WinGetPos, X, Y, W, H, %title%
	winMove, %title%,, %X%, %Y%, (W-10), %H%
return

#^!l::
	winGetTitle, title, a
	WinGetPos, X, Y, W, H, %title%
	winMove, %title%,, %X%, %Y%, (W+10), %H%
return

#^!Numpad1::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	; win size
	winMove, %title%,,,, (A_ScreenWidth/2), (A_ScreenHeight-padding_top)
	; win position
	winMove, %title%,, padding_left, padding_top
return
; WinMove, WinTitle, WinText, X, Y , Width, Height, ExcludeTitle, ExcludeText

#^!Numpad2::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), ((A_ScreenHeight/2)-padding_botton)
	winMove, %title%,, (A_ScreenWidth/2), padding_top
return

#^!Numpad3::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), ((A_ScreenHeight/2)-padding_botton)
	winMove, %title%,, (A_ScreenWidth/2), (A_ScreenHeight/2)
return

#^!Numpad4::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), (A_ScreenHeight-padding_top)
	winMove, %title%,, (A_ScreenWidth/2), padding_top
return

^!k::
	WinSet, Style, -0xC40000, A
return
^!l::
	WinSet, Style, +0xC40000, A
return

CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}