initialization
initialize
	super initialize.

	self addAll: { layoutLook := BrLayoutLook linearHorizontal hMatchParent layoutDo: [ :aLayout | aLayout alignCenterLeft ] }.
	
	self beCompact