executing
executeOn: aTextEditor

	aTextEditor selection isEmpty
		ifTrue: [ ^ self ].

	aTextEditor selection deselect: self fromIndex to: self toIndex.
	aTextEditor updateSelection: self fromIndex to: self toIndex