examples
exampleScrollbar
<example>
	| sb box space|
	
	BrMdTheme load.
	
	sb := BrScrollbar horizontal 
		margin: (BlInsets all: 5);
		size: 300@10;
		max: 500;
		visibleAmount: 100;
		scrollValue: 10.

	box := BrHBoxPane new
		layoutDo:[:l| l alignCenter];
		constraintsDo:[:c| 
			c vertical matchParent.
			c horizontal matchParent.];
		addChild: sb.
	
	space := BlSpace new.
	space root addChild: box.
	space show