initialization
initializeLook
	super initializeLook.
	
	self widget
		layout: self layout;
		constraintsDo: [ :c |
			c horizontal resizer: self resizer.
			c vertical resizer: self resizer ]