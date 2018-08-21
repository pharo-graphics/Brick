initialization
initialize
	super initialize.

	self add: BrLabelLook new thin.

	bar := BlElement new.
	bar visibility: BlVisibility hidden.
	bar background: PrimaryBorderColor.
	bar constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignBottom.
		c vertical exact: 2.
		c horizontal matchParent ]