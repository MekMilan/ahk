global clock := ""

setTimer, update, 500

start_gui()

update() {
	clock()
}

start_gui() {

	; make your layout here
	clock()
	add_sep("")
	add_text("just test 123")
	add_sep("")
	add_btn("a", "hello")

	; default config
	gui, +caption +AlwaysOnTop +ToolWindow
	gui, Show, NoActivate y0 h22 w500 ;w%A_ScreenWidth%
}

clock() {
	if (clock == "") {
		gui, add, text, ym vclock w147
		clock := "ok"
	}
	else {
		FormatTime, data_time,, dddd, dd/MM/yyyy | HH:mm tt
		GuiControl, text, clock, %data_time%
	}
}

add_sep(char) {
	if (char == "") {
		gui, add, text, ym, |
	}
	else {
		gui, add, text, ym, %char%
	}
}

add_text(text) {
	if (text == "") {
		gui, add, text,, *BLANK_TEXT*
	}
	else {
		gui, add, text, ym, %text%
	}
}

add_btn(desc, function) {
	if (desc == "") {
		gui, add, text, ym, BTN_BLANK
	}
	else {
		gui, add, text, g%function% ym, [ %desc% ]
	}
}

; Functions

hello() {
	msgBox, ok
}

#SingleInstance, force
f12::reload