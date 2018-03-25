initialization
initialize
	super initialize.

	self addAll: {
		"for the roudned corners"
		BrMaterialRoundedLook.
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for toggleable background"
		backgroundLook := BrMaterialToggleBackgroundLook new.
		"for the icon"
		icon := BrIconLook new.
		"for the shadow"
		BrShadowLook }.