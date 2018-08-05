private - selection
recordSelection: aMonotoneTextSelection
	self selectionRecorder select: aMonotoneTextSelection in: self.

	(self selection + self selectionRecorder selection) isEmpty
		ifTrue: [ ^ self ].
		
	self moveCursorTo: (self selection + self selectionRecorder selection) to.
	self showCursor