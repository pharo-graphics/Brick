iterator - enumeration
previous
	| anItem aSize |
	
	aSize := self rope size.
	
	position <= (aSize + 1)
		ifFalse: [ self error: 'Index out of bounds: ', position asString ].
	
	anItem := rope collection at: (position min: aSize).
	position := position - 1.
	
	^ anItem