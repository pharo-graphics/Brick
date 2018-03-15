initialization
initialize
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for toggleable background"
		BrMaterialTabBackgroundLook.
		"for the icon"
		BrIconLook }.