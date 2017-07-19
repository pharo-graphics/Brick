text - insert
insertLine: aCharacter in: aTextEditor
	| aCommand |
	
	aCommand := self newInsertLineCommand.
	aCommand
		character: aCharacter;
		index: self index.

	aTextEditor enqueueCommand: aCommand