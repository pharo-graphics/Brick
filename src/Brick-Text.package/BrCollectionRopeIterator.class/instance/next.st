iterator - enumeration
next
	| anItem |	
	position >= 0
		ifFalse: [ self error: 'Index out of bounds: ', position asString ].

	anItem := rope collection at: (position max: 1).
	position := position + 1.

	^ anItem