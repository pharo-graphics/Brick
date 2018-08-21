hooks
onTabSelected: aTabModel
	| aContentElement |
	self widgetContent removeChildren.

	aContentElement := contentElementsCache
		at: aTabModel
		ifAbsentPut: [ aTabModel contentStencilBuilder asElement ].

	self widgetContent addChild: aContentElement