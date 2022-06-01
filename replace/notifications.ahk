global notification_window_name := "apenas um teste"
global notification_content := []
global _not_cont := []
global keep_open_switch := 0

notification_create()
{
    gui, new,, %notification_window_name%
    gui, +AlwaysOnTop -caption +ToolWindow
    gui, color, c262626, 0x262626
    gui, margin, 8,4
    gui, font, s12 cffffff, Consolas
    gui, add, text, g_ui_move w200 h20, 
    gui, add, edit, cffffff -E0x200 xm v_not_cont r5 w300 +ReadOnly -VScroll, Loading...
    gui, add, text, ym g_notification_close, X
    gui, show, NoActivate
    OnMessage(0x0200, "keep_open")
    OnMessage(0x2A3, "not_close")
    notification_move()
}

notification_move()
{
    WinGetPos,,, w, h, %notification_window_name%
    not_posX := (A_ScreenWidth-w)-8
    not_posY := 30
    winMove, %notification_window_name%,, %not_posX%, %not_posY%
    setTimer, _notification_close, 3000
}

_ui_move()
{
    PostMessage, 0xA1, 2,,, a
}

_notification_close()
{
    if (keep_open_switch == 0)
    {
        WinClose, %notification_window_name%
    }        
}

update_content()
{
    loop
    {
        FileReadLine, line, %A_ScriptDir%\aaa.txt, %A_Index%
        if ErrorLevel
            break
        notification_content = %line%
    }
}

keep_open()
{
    keep_open_switch := 1
}
not_close()
{
    WinClose, %notification_window_name%
}

update_content()
notification_create()
GuiControl, text, _not_cont, %notification_content%

f12::Reload
^esc::ExitApp