initialization
initializeLook
	super initializeLook.

	self widget
		size: 14@14;
		layout: BlFrameLayout new;
		padding: (BlInsets all: 3);
		border: (BlBorder builder width: 1; build);
		geometry: BlEllipse new.

	self widget addChild: thumb.

	self updateColor