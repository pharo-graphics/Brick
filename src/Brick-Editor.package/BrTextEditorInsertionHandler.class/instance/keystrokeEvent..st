keyboard handlers
keystrokeEvent: anEvent
	| aCharacter |

	aCharacter := anEvent char.
	
	(Unicode isPrintable: aCharacter)
		ifFalse: [ ^ self ].

	anEvent consumed: true.

	anEvent currentTarget editor
		insertAtCursor: anEvent char asString