as yet unclassified
contentMouseWheel: anEvent
	anEvent isScrollUp
		ifTrue: [ vbar decrement ].
	anEvent isScrollDown
		ifTrue: [ vbar increment ].
	anEvent isScrollLeft
		ifTrue: [ hbar decrement ].
	anEvent isScrollRight
		ifTrue: [ hbar increment ]