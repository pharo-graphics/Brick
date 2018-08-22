accessing
widgetProgress
	"Return widget's progress container element"
	<return: #BlElement>

	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].

	"if widget does not have explicit #content container, we treat widget as a container itself"
	self widgetContent
		childNamed: self widgetProgressName
		ifFound: [ :anElement | ^ anElement ]
		ifNone: [ | anElement |
			anElement := self newProgressElement.
			self widgetContent addChild: anElement as: self widgetProgressName.
			^ anElement ]