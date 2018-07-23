initialization
initialize
	super initialize.

	self beCompact.
	
	self addAll: { BrLayoutLook linearHorizontal hMatchParent layoutDo: [ :aLayout | aLayout alignCenterLeft ] }