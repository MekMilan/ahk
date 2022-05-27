padding_top 	:= 25
padding_botton 	:= 25
padding_left	:= 0

; w 14 h 8

WinGet windows, List
Loop %windows%
{
	id := windows%A_Index%
	WinGetTitle wt, ahk_id %id%
	r .= wt . "`n"
}
MsgBox %r%

^!c::
	winGetTitle, title, a
	CenterWindow(title)
return

^!f::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,, padding_left, padding_top, (A_ScreenWidth), (A_ScreenHeight-padding_botton)
return

^!x::
	winGetTitle, title, a
	winClose, %title%
return

#^!Numpad1::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), (A_ScreenHeight-padding_botton)
	winMove, %title%,, padding_left, padding_top
return

#^!Numpad2::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), (A_ScreenHeight/2)-(padding_botton/2)
	winMove, %title%,, (A_ScreenWidth/2), padding_top
return

#^!Numpad3::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), (A_ScreenHeight/2)-(padding_botton/2)
	winMove, %title%,, (A_ScreenWidth/2), (A_ScreenHeight/2)+(padding_botton/2)
return

#^!Numpad4::
	winGetTitle, title, a
	winGetPos, x, y, w, h, %title%
	winMove, %title%,,,, (A_ScreenWidth/2), (A_ScreenHeight-padding_botton)
	winMove, %title%,, (A_ScreenWidth/2), padding_top
return


CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)/(Width/2), (A_ScreenHeight/2)/(Height/2)
}

#SingleInstance, force