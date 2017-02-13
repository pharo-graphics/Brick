initialization
initialize
	super initialize.
	
	scrollingElement := nil.
	scrollingDelta := 0@0.
	scrollingAction := self defaultScrollAction