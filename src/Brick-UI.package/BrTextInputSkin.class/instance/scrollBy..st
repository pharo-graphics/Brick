scrolling
scrollBy: aPoint
	| x y  |
	x := self textOffset x + aPoint x.
	y := self textOffset y + aPoint y.
	
	[y < 0] whileTrue: [ | h |
		h := text extent y.
		y := text layoutView layout extendOneLineUp 
			ifFalse: [ 0 ]
			ifTrue: [ y + (text extent y - h) ].
	 ].

	aPoint y > 0 ifTrue: [
		text layoutView extendLayoutDown: y ].
	
	"Don't scroll beyond layout"
	x := (x min: text extent y - innerContainer extent x) max: 0. 
	y := (y min: text extent y - innerContainer  extent y) max: 0.

	textContainer relocate: (x@y) negated.	
	