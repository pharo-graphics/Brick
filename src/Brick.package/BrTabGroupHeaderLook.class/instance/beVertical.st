api - layout
beVertical
	self header
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical resizer: self resizer ]