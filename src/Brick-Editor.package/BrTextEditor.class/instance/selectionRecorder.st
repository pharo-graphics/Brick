accessing
selectionRecorder
	<return: #BrTextEditorSelectionRecorder>

	self
		assert: [ selectionRecorder isNotNil ]
		description: [ 'Selection recorder can not be nil' ].

	^ selectionRecorder