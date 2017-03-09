as yet unclassified
initialize
	| label closeAction minAction maxAction |
	super initialize.
	self height: 25.

	label := BrLabel new
		text: (BrRopedText string: ' ');
		fontColor: Color white;
		fontSize: 10;
		constraintsDo: [ :c | c linear vertical alignCenter ].
		
	closeAction := BrActionItem new
		icon: (BrMdIcons windowCloseIcon
				background: Color white;
				extent: 15 @ 15);
		action: [ self space close ].
		
	minAction := BrActionItem new
		icon: (BrMdIcons windowMinimizeIcon
				background: Color white;
				extent: 15 @ 15);
		action: [ self space minimize].
		
	maxAction := BrActionItem new
		icon: (BrMdIcons windowMaximizeIcon
				background: Color white;
				extent: 15 @ 15);
		action: [ self space maximize ].
		
	self addChildren: {closeAction. maxAction. minAction. label}