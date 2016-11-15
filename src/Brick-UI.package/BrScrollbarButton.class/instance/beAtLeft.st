as yet unclassified
beAtLeft
	self constraintsDo: [ :c | 
		c linear vertical alignCenter.
		c linear horizontal alignLeft ].
	self geometry: BrMdIcons chevronLeftSvg