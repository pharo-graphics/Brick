initialization
initializeLook
	super initializeLook.
	
	listElement dataSource listElement: self widgetContent.
	self widgetContent addChild: listElement as: #list.