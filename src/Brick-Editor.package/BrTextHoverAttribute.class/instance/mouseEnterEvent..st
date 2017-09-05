mouse handlers
mouseEnterEvent: anEvent
	anEvent currentTarget text
		attributes: { BrTextForegroundAttribute paint: Color red }.
	anEvent currentTarget
		invalidate;
		requestLayout