*Brick-Editor-Extensions
brickEditorColorIn: aComposite
	<brickEditorOrder: 0>
	
	aComposite custom
		display: [ :aColor | { aColor red. aColor green. aColor blue. aColor alpha } collect: [ :aNumber | (aNumber * 255) floor ] ];
		segments: [ :anArray :anIndex |
			{
				'decimal' -> (anArray at: anIndex) printString.
				'hex' -> (anArray at: anIndex) printStringHex.
				'octal' -> ((anArray at: anIndex) printStringBase: 8).
				'binary' -> ((anArray at: anIndex) printStringBase: 2) } ]
			iterator: #yourself
			while: [ :anArray :anIndex | anIndex <= anArray size ];
		items: [ :anArray :anIndex | anArray at: anIndex ]
			iterator: #yourself
			while: [ :anArray :anIndex | anIndex <= anArray size ];
		layout: [ BlLinearLayout vertical ];
		segment: [ BrEditorSegmentElement new
			constraintsDo: [ :c |
				c margin: (BlInsets all: 10).
				c padding: (BlInsets all: 5) ];
			border: (BlBorder paint: Color black width: 1) ];
		item: [
			BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				addChildren: { BlTextElement new constraintsDo: [ :c | c minWidth: 300 ] . BlTextElement new } ];
		bind: [ :anItemElement :anItem |
			anItemElement children first text: (BrRopedText string: anItem key).
			anItemElement children second text: (BrRopedText string: anItem value) ].
		
	aComposite text
		display: [ :aColor | BrRopedText string: aColor class comment ] 