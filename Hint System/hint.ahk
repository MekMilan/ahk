;CoordMode, Mouse, Screen

global value_cmd := ""
global count := 1

global hint_match := []
global hint_posX := []
global hint_posY := []

!.::
    hint_spawn()
Return

hint_spawn()
{
    winGetTitle, title, a
    if WinActive("ahk_exe contabil.exe")
    {
        count = 1
        hint_create("a", 139, 100) ; trocar empresa
        hint_create("b", 190, 100) ; entradas
        hint_create("c", 238, 100) ; saidas
        hint_create("d", 289, 100) ; servicos
    }
    else if WinActive("ahk_exe jp2launcher.exe")
    {
        count = 1
        if WinActive("Impressão do DANFE.")
        {
            hint_create("a", 17, 44)
            hint_create("b", 40, 45)
        }
        else
        {
        	hint_create("a", 113, 188)
        	hint_create("c", 517, 188)
        	hint_create("d", 807, 188)
        	hint_create("e", 996, 188)
        	hint_create("f", 1129, 188)
        	hint_create("g", 109, 165)
        	hint_create("h", 663, 165)
        }
    }
    else
    {
        msgBox, window [%title%] not configured !
        reload
    }
    gui, -caption
    gui, margin, 0,0
	gui, add, edit, vvalue_cmd g_submit_cmd y0 w0
	gui, show, x0 y0
    return

    _submit_cmd:
        gui, Submit, NoHide
        buffer := value_cmd
        value_cmd := converter(value_cmd)
        
        switch (buffer)
        {
            case hint_match[value_cmd]:
                gui, Destroy
                tooltip,,,, value_cmd
                x := hint_posX[value_cmd]
                y := hint_posY[value_cmd]
                click, %x%, %y%
                reload
                return
            Default:
                msgBox, not found
                return
        }
    return

    GuiEscape:
        reload
    return
}

hint_create(match, posX, posY)
{
    hint_match.Push(match)
    hint_posX.Push(posX)
    hint_posY.Push(posY)
    tooltip, %match%, %posX%, %posY%, %count%
    count += 1
}

converter(value)
{
    switch (value)
    {
        case "a":
            value = 1
            return value
        case "b":
            value = 2
            return value
        case "c":
            value = 3
            return value
        case "d":
            value = 4
            return value
        case "e":
            value = 5
            return value
        case "f":
            value = 6
            return value
        case "g":
            value = 7
            return value
        case "h":
            value = 8
            return value
        case "i":
            value = 9
            return value
        case "j":
            value = 10
            return value
        case "k":
            value = 11
            return value
        case "l":
            value = 12
            return value
        case "m":
            value = 13
            return value
        case "n":
            value = 14
            return value
        case "o":
            value = 15
            return value
        case "p":
            value = 16
            return value
        case "q":
            value = 17
            return value
        case "r":
            value = 18
            return value
        case "s":
            value = 19
            return value
        case "t":
            value = 20
            return value
        case "u":
            value = 21
            return value
        case "v":
            value = 22
            return value
        case "w":
            value = 23
            return value
        case "x":
            value = 24
            return value
        case "y":
            value = 25
            return value
        case "z":
            value = 26
            return value
        Default:
            return value
    }
    return value
}

#SingleInstance, force
f12::reload