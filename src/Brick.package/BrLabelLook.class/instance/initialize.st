initialization
initialize
	super initialize.
	
	labelText := 'Label' asRopedText.
	
	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder attributesTarget: labelText.
	
	labelElement := BlTextElement new