text - selection
selectToLeft
	| fromIndex toIndex newCursorPosition |
	
	self
		assert: [ self hasSelection not
			or: [ self cursor position = self selection from
				or: [ self cursor position = self selection to ] ] ]
		description: [ 'If there is selection cursor must be located either at the start or end of selection interval' ].
	
	"which also will be either start or the end of the selection"
	newCursorPosition := (self cursor position - 1) max: 0.

	self hasSelection
		ifTrue: [ 
			(self cursor position = self selection from)
				"Expand selection to the left"
				ifTrue: [
					fromIndex := newCursorPosition.
					toIndex := self selection to ]
				"Collapse selection to the left"
				ifFalse: [
					fromIndex := self selection from.
					toIndex := newCursorPosition ] ]
		ifFalse: [ 
			fromIndex := newCursorPosition.
			toIndex := self cursor position ].
	
	self selectNone.
	self
		select: fromIndex
		to: toIndex.

	self moveCursorTo: newCursorPosition.