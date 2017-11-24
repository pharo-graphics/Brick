initialization
defaultStylerEventHandler
	^ BlEventHandler on: BrTextStyledEvent do: [ :anEvent |		
		(anEvent text previousGeneration == self text generation)
			ifTrue: [
				self text rope: anEvent text text rope.
				self invalidateAll.
				self updateAll ]
			ifFalse: [ Error signal: 'Wrong generation!' ] ]