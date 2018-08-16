initialization
initialize
	super initialize.

	self addAll: {
		headerLook := BrTabGroupHeaderLook new 
		+ ((BrLayoutLook of: #header) linearHorizontal hMatchParent vFitContent)
		+ (BrLayoutLook of: #tabbar) linearHorizontal hMatchParent alignCenter
		+ (BrLayoutLook of: #toolbar) linearHorizontal.
		BrTabGroupContentLook new + (BrLayoutLook of: #content) matchParent.

		"layout of the tab whole group is linear vertical"
		BrLayoutLook linearVertical matchParent.
	}