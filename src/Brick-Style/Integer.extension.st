Extension { #name : #Integer }

{ #category : #'*Brick-Style' }
Integer >> asBrPt [
	^ BrStyleValue pt: self
]

{ #category : #'*Brick-Style' }
Integer >> asBrPx [
	^ BrStyleValue px: self
]

{ #category : #'*Brick-Style' }
Integer >> pt [
	^self
]

{ #category : #'*Brick-Style' }
Integer >> px [
	^self
]
