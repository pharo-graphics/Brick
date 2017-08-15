executing
executeOn: aTextEditor
	"This might look strange, but we do this for optimization purposes.
	When working with a text editor, the most often occuring situation is adding one character"
	string size = 1
		ifTrue: [ self insertCharacter: string first in: aTextEditor ]
		ifFalse: [ self insertString: string in: aTextEditor ]