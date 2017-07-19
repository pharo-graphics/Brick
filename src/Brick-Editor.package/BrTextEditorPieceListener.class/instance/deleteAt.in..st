text - modifications
deleteAt: aTextIndex in: aTextEditElement
	| aGlobalIndex | 

	aGlobalIndex := aTextEditElement text start + aTextIndex - 1.

	self editor delete: aGlobalIndex to: aGlobalIndex.

	aTextEditElement textChanged.

	self
		moveCursorTo: ((aTextIndex - 1) max: 0)
		in: aTextEditElement