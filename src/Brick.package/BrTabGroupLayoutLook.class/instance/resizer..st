accessing
resizer: aBlLayoutResizer
	resizer := aBlLayoutResizer.
	
	self widgetDo: [ :anElement |
		anElement constraintsDo: [ :c |
			c horizontal resizer: self resizer.
			c vertical resizer: self resizer ] ]