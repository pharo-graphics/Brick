accessing
splitter: aBrTextEditorSplitter
	self
		assert: [ aBrTextEditorSplitter isNotNil ]
		description: [ 'Splitter must not be nil' ].

	splitter := aBrTextEditorSplitter