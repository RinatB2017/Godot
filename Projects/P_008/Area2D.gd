extends Sprite

var dragging = false

var status = "none"
var tsize=Vector2()
var offset=Vector2()
var mpos=Vector2()

func ready():
	tsize=gettexture().getsize()
	setprocessinput(true)
	setprocess(true)

func process(delta):
	if status == "clicked":
		setglobal_pos(mpos + offset)

func input(ev):
	if ev.type == InputEvent.MOUSEBUTTON:
		if ev.buttonindex == BUTTONLEFT:
			if ev.ispressed() and _isclicked(ev.globalpos):
				status = "clicked"
				mpos = ev.globalpos
				offset = getglobalpos() - mpos
				print("clicked")
			else:
				status = "released"
				print("released")
		elif ev.type == InputEvent.MOUSEMOTION:
			if status == "clicked":
				print("move")
				mpos = getviewport().getmousepos()

func isclicked(pos):
	var spriterect
	var gpos = getglobalpos()
	if iscentered():
		spriterect = Rect2(gpos.x - tsize.x/2, gpos.y - tsize.y/2, tsize.x, tsize.y)
	else:
		spriterect = Rect2(gpos.x, gpos.y, tsize.x, tsize.y)
