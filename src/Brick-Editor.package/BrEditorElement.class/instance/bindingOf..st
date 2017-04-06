evaluation
bindingOf: aString
	^ aString -> (bindings at: aString asSymbol ifAbsent: [ nil ])