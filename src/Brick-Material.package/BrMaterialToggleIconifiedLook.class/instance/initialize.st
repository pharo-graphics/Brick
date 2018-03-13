initialization
initialize
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for toggleable background"
		BrMaterialToggleBackgroundLook.
		"for the icon"
		BrIconLook }.