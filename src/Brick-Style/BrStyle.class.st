Class {
	#name : #BrStyle,
	#superclass : #Object,
	#instVars : [
		'selector',
		'declaration',
		'conditions',
		'ordinal'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #comparing }
BrStyle >> < aStyle [
	^ (self compareTo: aStyle) = -1 or: (self specificity = aStyle specificity and: self ordinal < aStyle ordinal)
]

{ #category : #comparing }
BrStyle >> <= aStyle [
	^ ((self compareTo: aStyle) = 1) not
]

{ #category : #comparing }
BrStyle >> = aStyle [
	^ super = aStyle or: [ ((self compareTo: aStyle) = 0
		and: [ self selector = aStyle selector ]) and: [ self declaration = aStyle declaration ] ]
]

{ #category : #comparing }
BrStyle >> > aStyle [
	^ (self compareTo: aStyle) = 1 or: (self specificity = aStyle specificity and: self ordinal > aStyle ordinal)
]

{ #category : #comparing }
BrStyle >> >= aStyle [
	^ (self compareTo: aStyle) != -1
]

{ #category : #comparing }
BrStyle >> compareTo: aStyle [
	self isImportant = aStyle isImportant
		ifFalse: [ ^ self isImportant
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	self origin = aStyle origin
		ifFalse:
			[ ^ (self origin priority >= aStyle origin priority and: [ self specificity >= aStyle specificity ])
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	self specificity = aStyle specificity
		ifFalse: [ ^ self specificity >= aStyle specificity
				ifTrue: [ 1 ]
				ifFalse: [ -1 ] ].
	^ 0
]

{ #category : #accessing }
BrStyle >> conditions [
	^ conditions
]

{ #category : #accessing }
BrStyle >> conditions: anObject [
	conditions := anObject
]

{ #category : #accessing }
BrStyle >> declaration [
	^ declaration
]

{ #category : #accessing }
BrStyle >> declaration: anObject [
	declaration := anObject
]

{ #category : #testing }
BrStyle >> isImportant [
	^ declaration isImportant
]

{ #category : #testing }
BrStyle >> matchesStyleable: aStyleable pseudoClassStates: aPseudoClassStateList [
	self conditions
		ifNotNil: [ :cs | 
			 cs do: [ :c | 
					(c isValidOn: aStyleable) ifFalse: [ ^ false ] ] ].
			
	^ self selector matchesStyleable: aStyleable pseudoClassStates: aPseudoClassStateList
]

{ #category : #accessing }
BrStyle >> ordinal [
	^ ordinal
]

{ #category : #accessing }
BrStyle >> ordinal: anObject [
	ordinal := anObject
]

{ #category : #accessing }
BrStyle >> origin [
	^ selector origin
]

{ #category : #printing }
BrStyle >> printOn: aStream [
	aStream
		print: self declaration;
		space;
		print: self selector
]

{ #category : #accessing }
BrStyle >> selector [
	^ selector
]

{ #category : #accessing }
BrStyle >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
BrStyle >> specificity [
	^ selector specificity + (conditions isNotNil and: [ conditions isNotEmpty ]) asBit
]
