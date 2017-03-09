initialization
initializeBox
	box := BrStackPane new.
	box size: 20 @ 20.
	box margin: (BlInsets right: 3).
	box styleClass: #box.
	mark := self createMarkGraphics.
	box addChild: mark.
	self markChanged