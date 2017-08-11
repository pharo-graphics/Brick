accessing
styler: aStyler
	styler := aStyler.

	styler addEventHandlerOn: BrTextStyledEvent do: [ :anEvent |
		BlUniverse default animationManager
			addAnimation: (BrTextEditorPostAction on: [
				self
					assert: [ text size = anEvent text size ]
					description: [ 'Text size must not change during styling' ].
				text rope: anEvent text rope.
				self updateAll ]) ]