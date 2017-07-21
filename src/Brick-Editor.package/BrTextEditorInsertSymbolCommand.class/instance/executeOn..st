executing
executeOn: aTextEditor
	| aCommand |

	aCommand := (self isHomogeneIn: aTextEditor)
		ifTrue: [ self newHomogeneousInsert ]
		ifFalse: [ self newNonhomogeneousInsert ].

	aCommand
		character: self character;
		index: self index.
		
	aTextEditor enqueueCommand: aCommand