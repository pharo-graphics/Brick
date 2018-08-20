mouse handlers
mouseEnterEvent: anEvent
	super mouseEnterEvent: anEvent.
	
	self widgetContent border: (self widgetContent border copyWithPaint: hoveredBorderPaint)