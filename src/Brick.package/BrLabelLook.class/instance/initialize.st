initialization
initialize
	super initialize.
	
	text := 'Label' asRopedText.
	
	attributesBuilder := BlTextDelegatedAttributesBuilder new.
	attributesBuilder attributesTarget: text.
	
	labelElement := BlTextElement new.
	labelElement clipChildren: false