keyboard handlers
keystrokeEvent: anEvent
	| aCharacter |

	aCharacter := anEvent char.
	
	((Unicode isPrintable: aCharacter) or: [ aCharacter isSeparator ])
		ifFalse: [ ^ self ].

	anEvent consumed: true.

	self
		insert: anEvent char asString
		atCursorIn: anEvent currentTarget editor