mouse handlers
mouseLeaveEvent: anEvent
	super mouseLeaveEvent: anEvent.
	
	self widgetContent border: (self widgetContent border copyWithPaint: normalBorderPaint)