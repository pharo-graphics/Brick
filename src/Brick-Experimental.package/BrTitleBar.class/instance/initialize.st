as yet unclassified
initialize
	| iconMenu label action|
	super initialize.
	iconMenu := BrMdIcons menuIcon
		background: Color white;
		extent: 25 @ 25.
	label := BrLabel new
				text: 'New Window';
				fontColor: Color white;
				fontSize: 12;
				constraintsDo: [ :c | c vertical alignCenter ].
	action := BrActionItem new
				icon: iconMenu;
				action: [  ].
	
	self addChildren:{action. label}.
	