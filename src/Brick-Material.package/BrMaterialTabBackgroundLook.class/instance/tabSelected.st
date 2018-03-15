event handling
tabSelected
	super tabSelected.
	
	self bar removeFromParent.
	self widgetContent addChild: self bar