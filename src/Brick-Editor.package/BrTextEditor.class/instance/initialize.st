initialization
initialize
	super initialize.
	
	cursor := self defaultCursor.
	textEditListener := self defaultTextEditListener editor: self.
	selection := self defaultSelection.
	selectionRecorder := self defaultSelectionRecorder.
	text := self defaultText.
	segmentCollector := self defaultSegmentCollector.
	segmentCollector editor: self.
	segmentCollector text: text.
	segmentBuilder := self defaultSegmentBuilder.
	styler := self defaultStyler.
	stylerEventHandler := self defaultStylerEventHandler.
	commandMutex := Mutex new.
	interactions := OrderedCollection new.
	self initializeInteractions