private - selection
selection: aTextSelection
	selection := aTextSelection.
	selection isEmpty
		ifTrue: [ ^ self ].
		
	self moveCursorTo: self selection to.
	self showCursor