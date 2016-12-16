examples
exampleScrollPane
<example>
	| spane box space|
	
	BrMdTheme load.
	
	spane := (BrScrollPane content: (BlBitmap fromFileNamed: '/home/glenn/Images/cache-mouse-move.png'))
		margin:(BlInsets all:5);
		extent: 400@400.

	box := BrHBoxPane new
		layoutDo:[:l| l alignCenter];
		constraintsDo:[:c| 
			c vertical matchParent.
			c horizontal matchParent.];
		addChildren: { spane }.
	
	space := BlSpace new.
	space root addChild: box.
	space show.
	
	BlElementSelection on: spane.	