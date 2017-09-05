mouse handlers
mouseLeaveEvent: anEvent
	anEvent currentTarget text
		attributes: { BrTextForegroundAttribute paint: Color black }.
	anEvent currentTarget 
		invalidate;
		requestLayout