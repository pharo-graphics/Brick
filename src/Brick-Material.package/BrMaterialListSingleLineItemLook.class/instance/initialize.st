initialization
initialize
	super initialize.

	self addAll: { BrLayoutLook linearHorizontal hMatchParent layoutDo: [ :aLayout | aLayout alignCenterLeft ] }