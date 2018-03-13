initialization
initialize
	super initialize.

	self addAll: {
		"for basic layout parameters"
		BrMaterialButtonLayoutLook.
		"for the roudned corners"
		BrMaterialRoundedLook.
		"for toggleable background"
		BrMaterialToggleBackgroundLook.
		"for the label"
		BrLabelLook.
		"for the shadow"
		BrShadowLook }