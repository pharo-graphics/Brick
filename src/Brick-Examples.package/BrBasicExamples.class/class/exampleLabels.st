examples
exampleLabels
<example>
	| b1 b2  box space|
	
	BrMdTheme load.
	
	b1 := BrLabel new 
		text: 'simple label';
		margin:(BlInsets all:5);
		fontColor: Color blue.	
	
	b2 := BrLabel new 
		text: 'label with icon';
		margin:(BlInsets all:5);
		fontColor: Color black;
		fontSize: 14;
		icon: (BrMdIcons checkSvg extent:20@20).
	
	
	
	box := BrHBoxPane new
		layoutDo:[:l| l alignCenter];
		constraintsDo:[:c| 
			c horizontal matchParent.
			c vertical matchParent ];
		addChildren:{b1.b2}.
	
	space := BlSpace new.
	space root addChild: box.
	space show