text - cursor
moveCursorToStartPreviousWord
	| textIterator newPosition |
	"Moves cursor to the left by one character"

	"textIterator := self text iterator: 1 to: (self cursor position max: 1).
	newPosition := self cursor position.
	[ textIterator hasNext and: [ newPosition = self cursor position ] ] whileTrue: [
		| skip |
		skip := textIterator peek isSeparator.
		textIterator nextWord.
		skip ifFalse: [ newPosition := textIterator position - 1 ] ].

	self moveCursorTo: newPosition.
	self selectNone"