executing
executeOn: aTextEditor
	| aCommand |
	"when deleting an interval of >1 text items it is quite complicated to optimize,
	we will come back to it it later when selection works"
	self fromIndex = self toIndex
		ifFalse: [ self shouldBeImplemented ].
	
	aCommand := (aTextEditor text at: self fromIndex) isLineBreak
		ifTrue: [ self newDeleteLineCommand ]
		ifFalse: [ self newDeleteSymbolCommand ].
		
	aCommand index: self fromIndex.
	
	aTextEditor enqueueCommand: aCommand