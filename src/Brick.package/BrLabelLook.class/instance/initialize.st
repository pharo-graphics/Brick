initialization
initialize
	super initialize.
	
	labelText := '' asRopedText.
	labelElement := BlTextElement new.
	
	self when: BrLabelChanged do: [ :anEvent | self text: anEvent text ]