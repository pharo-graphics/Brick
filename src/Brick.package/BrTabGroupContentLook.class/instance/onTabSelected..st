hooks
onTabSelected: aTabModel
	self widgetContent removeChildren.
	self widgetContent addChild: aTabModel content value