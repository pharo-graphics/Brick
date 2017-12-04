demo - model and ui
link: uiElement to: modelElement
	modelElement constraintsDo: [ :c |
		c graph addConnectedEdge: (GtGraphEdge new
			from: modelElement
			to: uiElement) ]