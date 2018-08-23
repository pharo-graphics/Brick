initialization
initializeLook
	super initializeLook.
	
	self widgetContent
		size: 24@24;
		layout: BlLinearLayout horizontal alignCenter;
		background: Color white;
		geometry: BlCircle new