testing
isHomogeneIn: aTextEditor
	 | aText hasPrevious hasNext |
		
	aText := aTextEditor text.

	hasPrevious := self index > 0.
	hasNext := self index < aText size.

	(hasPrevious not and: [ hasNext not ])
		ifTrue: [ ^ false ].

	(hasPrevious and: [ hasNext ])
		ifTrue: [ ^ (aText at: self index) isSeparator not and: [ (aText at: self index + 1) isSeparator not ] ].

	hasPrevious
		ifTrue: [ ^ (aText at: self index) isSeparator not ].

	^ (aText at: self index + 1) isSeparator