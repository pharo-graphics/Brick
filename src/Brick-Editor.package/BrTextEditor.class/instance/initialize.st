initialization
initialize
	super initialize.
	
	cursor := self defaultCursor.
	textEditListener := self defaultTextEditListener editor: self.
	selection := self defaultSelection.
	selectionRecorder := self defaultSelectionRecorder.
	text := self defaultText.
	segmentsCollector := self defaultSegmentsCollector.
	segmentsCollector text: text