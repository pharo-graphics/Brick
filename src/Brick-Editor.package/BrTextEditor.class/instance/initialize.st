initialization
initialize
	super initialize.
	
	cursor := self defaultCursor.
	textEditListener := self defaultTextEditListener editor: self.
	selection := self defaultSelection