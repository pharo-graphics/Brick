initialization
defaultStylerEventHandler
	^ BlEventHandler on: BrTextStyledEvent do: [ :anEvent |
		self
			assert: [ text size = anEvent text size ]
			description: [ 'Text size must not change during styling' ].

		text rope: anEvent text rope.
		self invalidateAll.
		self updateAll ]