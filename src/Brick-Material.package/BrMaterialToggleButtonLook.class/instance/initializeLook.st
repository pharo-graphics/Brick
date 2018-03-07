initialization
initializeLook
	super initializeLook.

	widget layout: BlLinearLayout horizontal.
	widget constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c padding: (BlInsets all: 6) ].
	
	label := BlTextElement new.
	widget addChild: label.
	
	self initializeLabel