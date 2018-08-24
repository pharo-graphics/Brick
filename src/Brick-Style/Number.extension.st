Extension { #name : #Number }

{ #category : #'*Brick-Style' }
Number >> asBrEm [
	^ BrStyleValue em: self
]

{ #category : #'*Brick-Style' }
Number >> asBrMs [
	^ BrStyleValue ms: self
]

{ #category : #'*Brick-Style' }
Number >> asBrSec [
	^ BrStyleValue s: self
]

{ #category : #'*Brick-Style' }
Number >> asBrStyleValue [
	^ BrNumberValue value: self
]

{ #category : #'*Brick-Style' }
Number >> em [
	^ self
]

{ #category : #'*Brick-Style' }
Number >> ms [
	^ self 
]

{ #category : #'*Brick-Style' }
Number >> rem [
	^ self
]

{ #category : #'*Brick-Style' }
Number >> s [
	^ self * 1000
]
