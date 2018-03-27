accessing
verticalResizer: aBlLayoutResizer
	self
		assert: [ aBlLayoutResizer isNotNil ]
		description: [ 'Resizer must not be nil' ].
		
	verticalResizer := aBlLayoutResizer.
	self widgetDo: [ :anElement | self targetElement constraintsDo: [ :c | c vertical resizer: self verticalResizer ] ]