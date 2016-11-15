as yet unclassified
exampleScrollbar
<example>
	| sb box space|
	
	BrMdTheme load.
	
	sb := BrScrollbar horizontal 
		margin:(BlInsets all:5);
		extent: 300@10;
		max: 500;
		visibleAmount: 100;
		scrollValue: 10.
		
	box := BrHBoxPane new
		layoutDo:[:l| l alignCenter];
		constraintsDo:[:c| 
			c vertical matchParent.
			c horizontal matchParent.];
		addChildren:{sb}.
	
	space := BlSpace new.
	space root addChild: box.
	space show