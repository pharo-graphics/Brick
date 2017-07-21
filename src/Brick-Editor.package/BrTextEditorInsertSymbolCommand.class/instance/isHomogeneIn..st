testing
isHomogeneIn: aTextEditor
	 | aText hasPrevious hasNext |

	aText := aTextEditor text.

	hasPrevious := self index > 1.
	hasNext := self index < aText size.

	(hasPrevious not and: [ hasNext not ])
		ifTrue: [ ^ false ].

	(hasPrevious and: [ hasNext ])
		ifTrue: [ ^ (aText at: self index - 1) isPureSeparator not or: [ (aText at: self index + 1) isPureSeparator not ] ].

	hasPrevious
		ifTrue: [ ^ (aText at: self index - 1) isPureSeparator not ].

	^ (aText at: self index + 1) isPureSeparator