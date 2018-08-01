api - modification
deleteNextAtCursor
	"Delete currently selected text and delete a character to the right from the current cursor position"
	
	self deleteSelected.
	
	self cursor position >= self text size
		ifTrue: [ ^ self ].

	self
		delete: self cursor position
		to: self cursor position + 1