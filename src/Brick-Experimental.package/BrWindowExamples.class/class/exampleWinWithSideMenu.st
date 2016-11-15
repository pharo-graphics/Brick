as yet unclassified
exampleWinWithSideMenu
	| win space label action sidepane|
	space := BlSpace new.
	space extent: 800 @ 600.
	
	win := BrWindow in: space.
	win borderless: true.
	win position: 100 @ 100.
		
	label := BrLabel new
		text: 'My Window';
		fontColor: Color white;
		fontSize: 14;
		constraintsDo: [ :c | c linear vertical alignCenter ].
		
	
	
	sidepane := BrSideNavigation new
		menuDo:[:m| m addChild:(BrToolbar new addChild:(BrLabel new
		text: 'My Menu';
		fontColor: Color white;
		fontSize: 14;
		constraintsDo: [ :c |  c linear vertical alignCenter ]))].
	
	action := BrActionItem new
		icon: (BrMdIcons menuIcon
			background: Color white;
			extent: 25 @ 25);
		action: [ sidepane open ].
	
	win root
		addChildren:
			{sidepane.(BrToolbar new addChildren: {action. label})}.
	win show