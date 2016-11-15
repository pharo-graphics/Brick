selection
selectWordAt: aTextPositon
	| current before after |
	current := aTextPositon.
	
	(current isAtEnd or:[current isAtEnd]) ifTrue:[
		self editorModel moveToLineStart.
		self editorModel moveSelectionEndTo: current moveToLineEnd.
		self selectionProperty notifyValueChanged.
		^ self
		].
	
	before  := current clone.
	[ | c | (c := before getCharacter) notNil and: [c tokenish ] ] whileTrue: [ before := before moveLeft: 1 ].
	after := current clone moveRight: 1.
	[ | c | (c := after getCharacter) notNil and: [ c tokenish ] ] whileTrue: [ after := after moveRight: 1 ].
	
	(after isAtEnd or:[after isAtEnd]) ifFalse:[after := after moveLeft: 1.].
	self editorModel moveCursorTo: before.
	self editorModel moveSelectionEndTo: after.
	self selectionProperty notifyValueChanged
	