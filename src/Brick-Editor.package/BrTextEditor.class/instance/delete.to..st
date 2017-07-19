text - modifications
delete: aFromTextIndex to: aToTextIndex
	| aCommand |
	
	aCommand := self newDeleteCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand