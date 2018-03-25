example - instance creation
buttonLabelElement
	<gtExample>
	
	^ (BlTextElement text: self labelText asRopedText)
		constraintsDo: [ :c |
			c frame vertical alignCenter.
			c frame horizontal alignCenter ]