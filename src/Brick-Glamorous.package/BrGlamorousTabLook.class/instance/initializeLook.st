initialization
initializeLook
	super initializeLook.

	self widgetContent
		layout: BlLinearLayout horizontal alignCenter;
		padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12);
		constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal fitContent ];
		addChild: bar