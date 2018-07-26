initialization
initializeLook
	super initializeLook.

	labelElement text: text.
	self widgetContent addChild: labelElement as: #label