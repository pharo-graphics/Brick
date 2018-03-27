initialization
initializeLook
	super initializeLook.

	self targetElement
		layout: self layout;
		constraintsDo: [ :c |
			c horizontal resizer: self horizontalResizer.
			c vertical resizer: self verticalResizer ]