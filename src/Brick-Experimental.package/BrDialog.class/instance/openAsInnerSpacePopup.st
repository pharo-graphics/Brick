as yet unclassified
openAsInnerSpacePopup
	
	
	| sp isp|
	sp := BlSpace new.
		
	isp	 := BrInnerSpace new
		extent: 300 @ 250;
		position: 100 @ 100;
		root: self.

	sp root addChild:isp.
	sp show