initialization
initializeLook
	super initializeLook.

	self widget
		layout: BlFrameLayout new;
		padding: (BlInsets all: 4);
		border: (BlBorder builder width: 1; build);
		geometry: (BlRectangle new);
		size: 36@14.

	self widget addChildren: { track . thumb }.
	
	self updateColor.
	self updateCornerRadius