text - insert
insertSeparator: aCharacter in: aTextEditor
	| aCommand |
	
	aCommand := self newInsertSeparatorCommand.
	aCommand
		character: aCharacter;
		index: self index.
		
	aTextEditor enqueueCommand: aCommand