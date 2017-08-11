executing
executeOn: aTextEditor

	aTextEditor selection isEmpty
		ifTrue: [ ^ self ].

	aTextEditor selection deselect: self fromIndex to: self toIndex.
	aTextEditor update: self fromIndex to: self toIndex