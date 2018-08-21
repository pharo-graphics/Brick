private - accessing
onTabSelected: aTabModel
	self toolbar removeChildren.
	self toolbar addChild: aTabModel actionStencilBuilder asElement