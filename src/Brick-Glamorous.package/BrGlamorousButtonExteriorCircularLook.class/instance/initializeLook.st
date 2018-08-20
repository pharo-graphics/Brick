initialization
initializeLook
	super initializeLook.
	
	self widgetContent
		size: 30@30;
		layout: BlLinearLayout horizontal alignCenter;
		background: Color white;
		geometry: BlCircle new