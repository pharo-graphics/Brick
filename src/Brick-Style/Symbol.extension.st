Extension { #name : #Symbol }

{ #category : #'*Brick-Style' }
Symbol >> asBl2StyleValue [
	^ Bl2SymbolValue value: self
]

{ #category : #'*Brick-Style' }
Symbol >> asBrStyleValue [
	^ BrSymbolValue value: self
]
