initialization
initializeLook
	super initializeLook.
	
	widget layout: BlLinearLayout horizontal alignCenter.
	widget constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c padding: (BlInsets all: 6) ]