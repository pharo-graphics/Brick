private - accessing
onTabSelected: aTabModel
	self toolbar removeChildren.
	self toolbar addChild: aTabModel actionStencilBuilder asElement.
	self widgetContent removeChildren.
	self widgetContent addChild: aTabModel contentStencilBuilder asElement.