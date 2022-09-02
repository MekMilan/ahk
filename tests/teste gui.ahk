global clock := ""
global text_clock := ""

setTimer, update, 500


add_sep("")
add_text("apenas um teste")
add_sep("-")
add_text("teste123")

update() {
	clock()
	GuiControl, text, text_clock, %clock%
}

start_gui() {
	gui, +caption +AlwaysOnTop +ToolWindow
	gui, add, text, ym vtext_clock w200
	gui, Show, NoActivate y0 h22 w500 ;w%A_ScreenWidth%
}
start_gui()

clock() {
	FormatTime, data_time,, dddd, dd/MM/yyyy | HH:mm tt
	clock := data_time
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

add_btn(desc) {
	if (desc == "") {
		gui, add, button, ym, BLANK
	}
	else {
		gui, add, button, ym, %desc%
	}
}

#SingleInstance, force
f12::reload