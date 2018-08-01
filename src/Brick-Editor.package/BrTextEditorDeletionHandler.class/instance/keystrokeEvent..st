keyboard handlers
keystrokeEvent: anEvent
	| aCharacter |

	aCharacter := anEvent char.
	
	(aCharacter ~= Character backspace and: [ aCharacter ~= Character delete ])
		ifTrue: [ ^ self ].

	anEvent consumed: true.

	aCharacter = Character backspace
		ifTrue: [ anEvent currentTarget editor deletePreviousAtCursor ].
		
	aCharacter = Character delete
		ifTrue: [ anEvent currentTarget editor deleteNextAtCursor ]