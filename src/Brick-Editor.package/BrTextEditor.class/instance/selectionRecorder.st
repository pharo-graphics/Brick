accessing
selectionRecorder
	<return: #BrTextEditorSelectionOverwriteRecorder>

	self
		assert: [ selectionRecorder isNotNil ]
		description: [ 'Selection recorder can not be nil' ].

	^ selectionRecorder