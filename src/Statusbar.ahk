
global current_window           := ""
global current_window_switch    := 1 ; 0 = OFF | 1 = ON
global volume_switch            := 1 ; 0 = OFF | 1 = ON
global statusbar_gui_color        := "262626"
global statusbar_font_color       := "ffffff"
global statusbar_ancient_color    := "8000ff"
SetTimer, Update, 200

gui, -caption +AlwaysOnTop +ToolWindow
gui, margin, 2,2
gui, font, s10 c%statusbar_font_color%, Consolas
gui, Color, c%statusbar_gui_color%

gui, add, text, ym v_workspace_1 g_goto_workspace_1, [1]
gui, add, text, ym v_workspace_2 g_goto_workspace_2, [2]
gui, add, text, ym, |
gui, add, text, Center ym w15 h16 g_window_close, X
gui, add, text, Center ym w15 h16 g_window_maximize, Λ
gui, add, text, Center ym w15 h16 g_window_minimize, -
gui, add, text, ym, |


; current window
gui, add, text, ym v_current_window g_get_title_current_window, %current_window%


; tray icons
gui, add, text, ym v_volume_icon g_volume_mute, 🔊 
gui, add, text, ym v_clock


gui, show, NoActivate w%A_ScreenWidth% y0 h22

_window_close()
{
	WinClose, %current_window%
}
_window_maximize()
{
	WinMaximize, %current_window%
}
_window_minimize()
{
	WinMinimize, %current_window%
}

_goto_workspace_1()
{
    VD.goToDesktopNum(1)
    gui, font, c%statusbar_ancient_color%
    GuiControl, font, _workspace_1
    reset_workspace_colors(1)
}
_goto_workspace_2()
{
    VD.goToDesktopNum(2)
    gui, font, c%statusbar_ancient_color%
    GuiControl, font, _workspace_2
    reset_workspace_colors(2)
}
reset_workspace_colors(index)
{
    if (index == 1)
    {
        gui, font, c%statusbar_font_color%
        GuiControl, font, _workspace_2
    }
    else
    {
        gui, font, c%statusbar_font_color%
        GuiControl, font, _workspace_1
    }  
}

current_window()
{
    if (current_window_switch == 1)
    {
        WinGetTitle, title, a
        if (title != "Statusbar.ahk" && title != current_window)
        {
            if (title == "Program Manager")
            {
                title := "Desktop"
            }
            current_window := title
            current_window_len := StrLen(current_window)
            current_window_len := (current_window_len*7)

            GuiControl, move, _current_window, w%current_window_len%
            GuiControl,, _current_window, %current_window%
        }
    }
}
_get_title_current_window()
{
    if (current_window_switch == 1)
    {
        Clipboard := current_window

        gui, font, c%statusbar_ancient_color%
        GuiControl, font, _current_window
        sleep, 2000
        gui, font, c%statusbar_font_color%
        GuiControl, font, _current_window
    }
}

_volume_mute()
{
    SoundGet, current_volume
    if (current_volume == 100)
    {
        SoundSet, 0
        gui, font, cff0000
        GuiControl, font, _volume_icon
        GuiControl,, _volume_icon, 🔈
    }
    else
    {
        SoundSet, 100
        GuiControl,, _volume_icon, 🔊
    }
}

tray()
{
    ;   <Clock>
    FormatTime, data_time,, dddd, dd/MM/yyyy | HH:mm tt
    GuiControlGet, clock_date_time,, _clock
    if (clock_date_time != data_time)
    {
        data_time_len := StrLen(data_time)
        data_time_len := (data_time_len*7)+22
        clock_pos := (A_ScreenWidth-data_time_len)
        GuiControl, move, _clock, w%data_time_len% x%clock_pos%
        clock := "| "data_time
        GuiControl,, _clock, %clock%
    
        ;   <Volume>
        if (volume_switch == 1)
        {
            volume_pos := (clock_pos-20)
            gui, font, s12 c%statusbar_font_color%, Consolas
            gui, Color, c%statusbar_gui_color%
            GuiControl, font, _volume_icon
            GuiControl, move, _volume_icon, w15 x%volume_pos%
        }
    }
}

Update()
{
    tray()
    current_window()
}

fullscreen()
{
	WinGetPos,,, w, h, A
	return (w = A_ScreenWidth && h = A_ScreenHeight)
}

Start()
{
    ; activate workspace1
    gui, font, c%statusbar_ancient_color%
    GuiControl, font, _workspace_1
}
Start()

;   <Workspaces>
!^1::
    _goto_workspace_1()
return
!^2::
    _goto_workspace_2()
return

;   <Run>
!f::
    current_window_switch := 0
    GuiControl,, _current_window, Run:
    GuiControl, move, _current_window, w50

    gui, run:-caption +ToolWindow +AlwaysOnTop
    gui, run:font, s9 c%statusbar_font_color%, Consolas
    gui, run:Color,, %statusbar_gui_color%
    gui, run:margin, 0,0
    gui, run:add, edit, -E0x200 w300 h15 v_input_command,
    gui, run:add, button, Default w0 h0 g_submit_command
    gui, run:show, x148 y3
    return

    _submit_command:
        gui, run:Submit, NoHide

        ; get value from editbox (IDK WHY NEED THIS !!)
        GuiControlGet, _input_command
        command(_input_command)
        gui, run:Destroy
        if (current_window_switch == 0)
        {
            current_window_switch := 1
            current_window := ""
        }
    return

    runGuiEscape:
        gui, run:Destroy
        if (current_window_switch == 0)
        {
            current_window_switch := 1
            current_window := ""
        }
    return

return

;   <Show/Hide Taskbar>
!9::
    gui, hide
	HideShowTaskbar(false)
    ;WinShow, ahk_class Shell_TrayWnd
	;WinShow, ahk_class Shell_SecondaryTrayWnd
    return
!0::
    gui, show
    HideShowTaskbar(true)
    ;WinHide, ahk_class Shell_TrayWnd
	;WinHide, ahk_class Shell_SecondaryTrayWnd
    return
   
HideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
}

#SingleInstance, force
#Include, modules\VD.ahk
#Include, %A_ScriptDir%\Commands.ahk
#Include, %A_ScriptDir%\Utils.ahk
#Include, %A_ScriptDir%\openWith.ahk
#Include, %A_ScriptDir%\openFolder.ahk
f12::reload