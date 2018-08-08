hooks
onItemContentChanged: aBrStencilBuilder
	self widgetDo: [ 
		self widgetContent removeChildren.
		self widgetContent addChild: aBrStencilBuilder asElement ]