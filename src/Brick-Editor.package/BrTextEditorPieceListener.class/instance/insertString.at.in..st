text - modifications
insertString: aString at: aTextIndex in: aTextEditElement
	"Insert a given string in a provided text edit element.
	The exact location of an inserted string is determined by current cursor location"
	"aTextIndex is given in local text coordinates of a single text piece (word) element.
	It should be converted to a global index of the whole text model"
	| aGlobalIndex |

	aGlobalIndex := (aTextEditElement text start + aTextIndex - aTextIndex isZero not asBit) max: 0.

	self editor
		insertString: aString
		at: aGlobalIndex.

	self
		moveCursorRight: aTextEditElement
		by: aString size.

	aTextEditElement textChanged