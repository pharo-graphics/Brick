initialization
initializeLook
	super initializeLook.

	self targetElement
		constraintsDo: [ :c |
			c horizontal resizer: self horizontalResizer.
			c vertical resizer: self verticalResizer.
			consraintsBlock value: c ].
		
	
	self layout
		ifNotNil: [ self targetElement layout: self layout ].

	self updateAlignment