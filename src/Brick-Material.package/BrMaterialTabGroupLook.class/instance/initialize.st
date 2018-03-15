initialization
initialize
	super initialize.

	self addAll: {
		header := BrTabGroupHeaderLook horizontal.
		content := BrTabGroupContentLook new.
		layout := BrTabGroupLayoutLook vertical
	}.
	
	self matchParent