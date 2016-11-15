as yet unclassified
trackMouseWheel: anEvent

	anEvent isScrollDown
		ifTrue: [ self controller incrementValue ].
	anEvent isScrollUp
		ifTrue: [ self controller decrementValue ]