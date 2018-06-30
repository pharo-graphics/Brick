initialization
initialize
	super initialize.
	self textAttributes: [ { BrTextForegroundAttribute paint: Color random paler } ].