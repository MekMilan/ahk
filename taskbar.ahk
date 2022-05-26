global clock                    := ""
global current_window           := ""
global current_window_switch    := 1 ; 0 = OFF | 1 = ON
global taskbar_gui_color        := "262626"
global taskbar_font_color       := "ffffff"
global taskbar_ancient_color    := "8000ff"
SetTimer, Update, 300

gui, -caption +AlwaysOnTop +ToolWindow
gui, margin, 2,2
gui, font, s10 c%taskbar_font_color%, Consolas
gui, Color, c%taskbar_gui_color%

gui, add, text, ym v_workspace_1 g_goto_workspace_1, [1]
gui, add, text, ym v_workspace_2 g_goto_workspace_2, [2]
gui, add, text, ym, |
; current window
gui, add, text, ym v_current_window g_get_title_current_window, %current_window%
; clock
gui, add, text, ym v_clock, %clock%

gui, show, NoActivate w%A_ScreenWidth% y0

_goto_workspace_1()
{
    VD.goToDesktopNum(1)
    gui, font, c%taskbar_ancient_color%
    GuiControl, font, _workspace_1
    reset_workspace_colors(1)
}

_goto_workspace_2()
{
    VD.goToDesktopNum(2)
    gui, font, c%taskbar_ancient_color%
    GuiControl, font, _workspace_2
    reset_workspace_colors(2)
}

reset_workspace_colors(index)
{
    if (index == 1)
    {
        gui, font, c%taskbar_font_color%
        GuiControl, font, _workspace_2
    }
    else
    {
        gui, font, c%taskbar_font_color%
        GuiControl, font, _workspace_1
    }  
}

current_window()
{
    if (current_window_switch == 1)
    {
        WinGetTitle, title, a
        if (title != "taskbar.ahk")
        {
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

        gui, font, c%taskbar_ancient_color%
        GuiControl, font, _current_window
        sleep, 2000
        gui, font, c%taskbar_font_color%
        GuiControl, font, _current_window
    }
}

clock()
{
    FormatTime, data_time,, dddd, dd/MM/yyyy | HH:mm tt
    data_time_len := StrLen(data_time)
    data_time_len := ((data_time_len+14)*5)
    clock_pos := (A_ScreenWidth-data_time_len)
    GuiControl, move, _clock, w%data_time_len% x%clock_pos%
    clock := data_time

    GuiControl,, _clock, %clock%
}

Update()
{
    clock()
    current_window()    
}

Start()
{
    ; activate workspace1
    gui, font, c%taskbar_ancient_color%
    GuiControl, font, _workspace_1
}
Start()

rmtt()
{
    ToolTip
}

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

    gui, run:-caption +ToolWindow +AlwaysOnTop
    gui, run:font, s9 c%taskbar_font_color%, Consolas
    gui, run:Color,, %taskbar_gui_color%
    gui, run:margin, 0,0
    gui, run:add, edit, -E0x200 w300 h15 v_input_command, type your command...
    gui, run:add, button, Default w0 h0 g_submit_command
    gui, run:show, x85 y3
    return

    _submit_command:
        gui, run:Submit, NoHide
        command(%_input_command%)
        msgBox, %_input_command%
        gui, run:Destroy
        if (current_window_switch == 0)
        {
            current_window_switch := 1
        }
    return

    runGuiEscape:
        gui, run:Destroy
        if (current_window_switch == 0)
        {
            current_window_switch := 1
        }
    return

return

;   <Show/Hide Taskbar>
!9::
    gui, hide
    return
!0::
    gui, show
    return

#Include, VD.ahk
#Include, %A_ScriptDir%\.Terminal.ahk
f12::reload
#SingleInstance, force