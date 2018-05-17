initialization
initializeLook
	super initializeLook.

	self widget
		size: 22@14;
		layout: BlFrameLayout new;
		padding: (BlInsets all: 3);
		border: (BlBorder builder width: 1; build);
		geometry: (BlRectangle cornerRadius: 8).

	self widget addChild: thumb.

	self updateColor