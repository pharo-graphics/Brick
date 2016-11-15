as yet unclassified
open
	
	BlSpace new
		borderless: true;
		extent: 150@300;
		position: 200@200;
		root: self;
		addEventHandler: (BlEventHandler on:BlWindowFocusOutEvent do:[:evt| self space close]);
		show.
	self requestFocus.