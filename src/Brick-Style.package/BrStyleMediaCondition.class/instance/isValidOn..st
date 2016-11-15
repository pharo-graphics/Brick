testing
isValidOn: aTarget
	| typeTarget |
	typeTarget := BrStyleMediaTarget
		perform: (self type , 'On:') asSymbol
		with: aTarget.
	conditions
		keysAndValuesDo:
			[ :k :v | 
			(self
				perform: (k , 'Of:' , 'value:') asSymbol
				withEnoughArguments:
					{typeTarget.
					v value})
				ifFalse: [ ^ false ] ].
	^ true