instance creation
onBindHolder: anElementHolder at: aPosition
	(self selection contains: aPosition)
		ifTrue: [ anElementHolder itemElement effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.15)) ]
		ifFalse: [ anElementHolder itemElement effect: BlNullEffect new ]