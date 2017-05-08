initialization
initialize
	super initialize.
	
	self addEventHandler: BrEditorListener new.
	self addEventHandler: BrSelectionHandler new.
	
	bindings := {
		#aDate -> self aDate.
		"#aFile -> self aFile."
		"#folder -> self folder."
		"#allMessages -> self allMessages.
		#latestMessages -> self latestMessages.
		#groupedMessages -> self groupedMessages" } asDictionary