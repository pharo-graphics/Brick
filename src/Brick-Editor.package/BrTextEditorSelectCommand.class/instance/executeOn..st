executing
executeOn: aTextEditor

	self fromIndex = self toIndex
		ifTrue: [ ^ self ].

	aTextEditor selection select: self fromIndex to: self toIndex.
	aTextEditor updateSelection: self fromIndex to: self toIndex