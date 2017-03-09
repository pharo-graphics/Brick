examples
exampleSwith
<example>
	| b1  box space|

	BrMdTheme load.

	b1 := BrSwitch new
		text: (BrRopedText string: 'i am a switch');
		margin: (BlInsets all: 5).

	box := BrHBoxPane new
		layoutDo:[ :l | l alignCenter ];
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ];
		addChild: b1.
	
	space := BlSpace new.
	space root addChild: box.
	space show