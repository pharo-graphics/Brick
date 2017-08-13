executing
executeOn: aTextEditor

	aTextEditor selection select: self fromIndex to: self toIndex.
	aTextEditor updateSelection: self fromIndex to: self toIndex