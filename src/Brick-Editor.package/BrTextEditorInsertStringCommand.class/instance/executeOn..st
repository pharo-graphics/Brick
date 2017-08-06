executing
executeOn: aTextEditor
	
	string size = 1
		ifTrue: [ self insertCharacter: string first in: aTextEditor ]
		ifFalse: [ self insertString: string in: aTextEditor ]