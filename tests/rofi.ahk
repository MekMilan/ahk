global _input := ""
global _teste := ""

gui() {
	gui, -MinimizeBox
	gui, margin, 0,0
	gui, font, s12, Consolas
	gui, add, edit, ym v_input gSubmit w250
	gui, add, ListBox, r5 v_teste gSubmit w250

	gui, add, button, gUp, up
	gui, add, button, gDown, down

	gui, add, button, default gRun w0 y0
	gui, show,, rofi

	Populate()
}

Up() {
	if WinActive("rofi") {
		ControlSend, _teste, {Up}
	}
}

Down() {
	if WinActive("rofi") {
		GuiControlGet, selected,, _teste
		tooltip, %selected%
		GuiControl, Choose, _teste, %next%
	}
}

Run() {
	switch (_teste)
	{
		case "app":
			msgBox, app
			return
		case "calc":
			run, calc.exe
			return
		case "time":
			msgBox, time
	}
}

Populate() {
	GuiControl,, _teste, app
	GuiControl,, _teste, calc
	GuiControl,, _teste, time

	GuiControl, Choose, _teste, 1
}

select(text) {
	GuiControl, Choose, _teste, %text%
}

GuiClose() {
	reload
}
GuiEscape() {
	reload
}

Submit() {
	gui, Submit, NoHide
	select(_input)
	tooltip, input: %_input% | selected: %_teste%, 500, 500
}

gui()
f12::reload