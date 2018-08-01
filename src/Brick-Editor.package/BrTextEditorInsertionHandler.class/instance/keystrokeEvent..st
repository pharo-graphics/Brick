keyboard handlers
keystrokeEvent: anEvent
	| aCharacter |

	aCharacter := anEvent char.
	
	(aCharacter isLetter or: [ aCharacter isDigit or: [ aCharacter isSpecial or: [ aCharacter isSeparator ] ] ])
		ifFalse: [ ^ self ].

	anEvent consumed: true.

	anEvent currentTarget editor
		insertAtCursor: anEvent char asString