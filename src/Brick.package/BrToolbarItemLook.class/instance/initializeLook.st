initialization
initializeLook
	super initializeLook.
	self widget 
		constraintsDo: [ :c | 
			c padding: (BlInsets all: 3) ]