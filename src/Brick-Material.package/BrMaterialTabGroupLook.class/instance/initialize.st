initialization
initialize
	super initialize.

	self addAll: {
		BrTabGroupHeaderLook new + (BrLayoutLook of: #header) linearHorizontal + (BrLayoutLook of: #tabbar) linearHorizontal + (BrLayoutLook of: #toolbar) linearHorizontal.
		BrTabGroupContentLook new + (BrLayoutLook of: #content) matchParent.

		"layout of the tab whole group is linear vertical"
		BrLayoutLook linearVertical matchParent.
	}