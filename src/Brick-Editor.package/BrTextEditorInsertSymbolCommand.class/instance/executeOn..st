executing
executeOn: aTextEditor
	| aPreviousCharacter aCommand |
	
	aPreviousCharacter := aTextEditor text at: self index.

	aCommand := (aPreviousCharacter isSeparator not and: [ aPreviousCharacter isLineBreak not ])
		ifTrue: [ self newHomogeneousInsert ]
		ifFalse: [ self newNonhomogeneousInsert ].

	aCommand
		character: self character;
		index: self index.
		
	aTextEditor enqueueCommand: aCommand