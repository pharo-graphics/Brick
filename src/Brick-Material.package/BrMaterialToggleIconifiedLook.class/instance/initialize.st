initialization
initialize
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for the roudned corners"
		BrMaterialRoundedLook.
		"for toggleable background"
		background := BrMaterialToggleBackgroundLook new.
		"for the icon"
		BrIconLook.
		"for the shadow"
		BrShadowLook }.