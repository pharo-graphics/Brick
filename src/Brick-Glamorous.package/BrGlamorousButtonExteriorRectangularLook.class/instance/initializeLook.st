initialization
initializeLook
	super initializeLook.

	self widgetContent
		padding: (BlInsets top: 0 right: 15 bottom: 0 left: 15);
		height: 30;
		constraintsDo: [ :c | c horizontal fitContent ];
		layout: BlLinearLayout horizontal alignCenter;
		background: Color white;
		geometry: (BlRectangle cornerRadius: 4)