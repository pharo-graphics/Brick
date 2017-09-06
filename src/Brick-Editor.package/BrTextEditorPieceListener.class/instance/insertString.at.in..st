text - modifications
insertString: aString at: aTextIndex in: aTextEditElement
	"Insert a given string in a provided text edit element.
	The exact location of an inserted string is determined by current cursor location"
	"aTextIndex is given in local text coordinates of a single text piece (word) element.
	It should be converted to a global index of the whole text model"
	| aGlobalIndex |
	
	self
		assert: [ aTextEditElement isAttachedToSceneGraph ]
		description: [ 'Text edit piece must be attached to the scene graph!' ].
	
	self
		assert: [ (self localTextIndexToGlobal: aTextEditElement cursorPosition in: aTextEditElement) = self editor cursor position ]
		description: [ 'Cursor position should be in sync!' ].
	
	aGlobalIndex := self localTextIndexToGlobal: aTextIndex in: aTextEditElement.
	self editor
		insertString: aString
		at: aGlobalIndex.

	self
		moveCursorRight: aTextEditElement
		by: aString size.

	aTextEditElement textChanged