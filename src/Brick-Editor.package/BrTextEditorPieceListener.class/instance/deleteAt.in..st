text - modifications
deleteAt: aTextIndex in: aTextEditElement
	| aGlobalIndex | 
	aGlobalIndex := aTextEditElement text start + aTextIndex - 1.
	
	"Can not delete text outside of text bounds"
	(aGlobalIndex between: 1 and: self editor text size)
		ifFalse: [ ^ self ].
	
	self editor delete: aGlobalIndex - 1 to: aGlobalIndex.
	self editor moveCursorTo: ((aGlobalIndex - 1) max: 0).

	aTextEditElement textChanged