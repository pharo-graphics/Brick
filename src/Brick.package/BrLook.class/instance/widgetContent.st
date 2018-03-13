accessing
widgetContent
	"Return widget's content container element"
	<return: #BlElement>
	
	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].
	
	"if widget does not have explicit #content container, we treat widget as a container itself"
	^ widget
		childNamed: #content
		ifFound: [ :anElement | anElement ]
		ifNone: [ widget ]