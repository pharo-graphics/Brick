initialization
defaultStylerEventHandler
	^ BlEventHandler on: BrTextStyledEvent do: [ :anEvent |		
		(anEvent text previousGeneration == self text generation)
			ifTrue: [
				self text rope: anEvent text text rope.
				self invalidateAll.
				self updateAll ]
			ifFalse: [
				Bloc debugModeEnabled
					ifTrue: [ Error signal: 'Wrong generation!' ].
				self styleText ] ]