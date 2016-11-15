as yet unclassified
openAt: aPosition
	
	BlSpace new
		borderless: true;
		extent: 150@300;
		position: aPosition - (150@0);
		root: self;
		addEventHandler: (BlEventHandler on:BlWindowFocusOutEvent do:[:evt| self space close]);
		show.
	self requestFocus.