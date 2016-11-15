as yet unclassified
beAtRight
	self constraintsDo: [ :c | 
		c linear vertical alignCenter.
		c linear horizontal alignRight  ].
	self geometry: BrMdIcons chevronRightSvg