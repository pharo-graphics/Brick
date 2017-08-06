text - insert
insertSymbol: aCharacter in: aTextEditor
	| aCommand |

	aCommand := self newInsertSymbolCommand.
	aCommand
		character: aCharacter;
		index: self index.
		
	aTextEditor enqueueCommand: aCommand