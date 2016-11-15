as yet unclassified
thumbChanged
	widget checked
		ifTrue: [ thumb constraintsDo: [ :c | c frame horizontal alignRight ] ]
		ifFalse: [ thumb constraintsDo: [ :c | c frame horizontal alignLeft ] ]