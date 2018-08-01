hooks
onTabSelected: aTabModel
	self widgetContent removeChildren.
	self widgetContent addChild: aTabModel contentStencilBuilder asElement