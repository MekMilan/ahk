start_gui() {
	gui, show	
}

sep() {
	gui, add, text, ym, |
}

texto() {
	gui, add, text, ym, texto 1
}

btn() {
	gui, add, button, ym, ok
}

sep()
texto()
sep()
btn()
sep()

update() {
	start_gui()
}

setTimer, update, 500
