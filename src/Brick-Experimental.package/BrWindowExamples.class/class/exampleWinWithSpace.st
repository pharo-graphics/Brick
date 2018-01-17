as yet unclassified
exampleWinWithSpace
	| p space |
	space := BlSpace new.
	space borderless: true.
	p := (BrWindow in: space)
		extent: 200 @ 200;
		position: 100 @ 100.
	p root
		addChild:
			(BrButton new
				text: (BrRopedText string: 'open menu');
				addEventHandler: (BrOnClickHandler do:[:evt|
					BrMenu new 
					openAt:evt screenPosition])).
	p show