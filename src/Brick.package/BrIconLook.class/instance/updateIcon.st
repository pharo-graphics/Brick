updating
updateIcon
	self widgetDo: [ self widgetContent
		childNamed: #icon
		ifFound: [ :anIconElement |
			| aParent anIndex |
			aParent := anIconElement parent.
			anIndex := aParent childIndexOf: anIconElement.
			anIconElement removeFromParent.
			aParent addChild: iconElement at: anIndex as: #icon ]
		ifNone: [ self widgetContent addChild: iconElement as: #icon ] ]