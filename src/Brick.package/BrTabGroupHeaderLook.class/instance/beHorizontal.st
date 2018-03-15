api - layout
beHorizontal	
	self header
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal resizer: self resizer.
			c vertical fitContent ]