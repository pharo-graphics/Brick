private - selection
selection: aTextSelection
	selection := aTextSelection.
	self selection isEmpty
		ifTrue: [ ^ self ].
		
	self moveCursorTo: self selection to.
	self showCursor