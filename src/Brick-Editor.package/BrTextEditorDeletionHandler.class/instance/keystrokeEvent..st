keyboard handlers
keystrokeEvent: anEvent
	| aCharacter |

	aCharacter := anEvent char.
	
	(aCharacter ~= Character backspace and: [ aCharacter ~= Character delete ])
		ifTrue: [ ^ self ].

	anEvent consumed: true.

	aCharacter = Character backspace
		ifTrue: [ self deletePreviousAtCursorIn: anEvent currentTarget editor ].
		
	aCharacter = Character delete
		ifTrue: [ self deleteNextAtCursorIn: anEvent currentTarget editor ]