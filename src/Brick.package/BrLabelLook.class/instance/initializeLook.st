initialization
initializeLook
	super initializeLook.

	labelElement text: labelText.
	self widgetContent addChild: labelElement as: #label