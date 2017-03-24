initialize-release
initialize
	super initialize.
	self initializeWidget.
	self controller: self defaultController.
	self skin: self defaultSkin.
	self mouseCursor: BlCursor default
	