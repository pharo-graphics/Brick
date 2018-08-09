initialization
initializeLook
	super initializeLook.
	self widget addChild: header as: #header.
	header addChild: tabbar as: #tabbar.
	header addChild: toolbar as: #toolbar