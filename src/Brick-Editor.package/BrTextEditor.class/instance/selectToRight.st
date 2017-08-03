text - selection
selectToRight
	| fromIndex toIndex newCursorPosition |
	
	self
		assert: [ self hasSelection not
			or: [ self cursor position = self selection from
				or: [ self cursor position = self selection to ] ] ]
		description: [ 'If there is selection cursor must be located either at the start or end of selection interval' ].
	
	"which also will be either start or the end of the selection"
	newCursorPosition := (self cursor position + 1) min: self text size.

	self hasSelection
		ifTrue: [ 
			(self cursor position = self selection to)
				"Expand selection to the right"
				ifTrue: [
					fromIndex := self selection from.
					toIndex := newCursorPosition ]
				"Collapse selection to the right"
				ifFalse: [
					fromIndex := newCursorPosition .
					toIndex := self selection to ] ]
		ifFalse: [ 
			fromIndex := self cursor position.
			toIndex := newCursorPosition ].

	self
		select: fromIndex
		to: toIndex.

	self moveCursorTo: newCursorPosition.