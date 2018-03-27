accessing
horizontalResizer: aBlLayoutResizer
	self
		assert: [ aBlLayoutResizer isNotNil ]
		description: [ 'Resizer must not be nil' ].

	horizontalResizer := aBlLayoutResizer.
	self widgetDo: [ :anElement | self targetElement constraintsDo: [ :c | c horizontal resizer: self horizontalResizer ] ]