as yet unclassified
openAsSpacePopup
	| sp |
	sp := BlSpace new
		borderless: true;
		resizable: false;
		extent: 300 @ 250;
		position: 100 @ 100.	
		
	sp root addChild: self.
	sp show.