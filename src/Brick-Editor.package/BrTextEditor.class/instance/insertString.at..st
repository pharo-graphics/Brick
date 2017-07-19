text - modifications
insertString: aString at: aTextIndex
	| aCommand |
	
	aCommand := self newInsertCommand
		string: aString;
		index: aTextIndex.
	self enqueueCommand: aCommand