as yet unclassified
initialize
	super initialize.
	self extent: 1@10.
	self managed: false.
	self background: Color black.
	blinking := false.
	self visibility: BlVisibility hidden.
	self createBlinkAnimation