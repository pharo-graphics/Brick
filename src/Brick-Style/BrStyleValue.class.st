Class {
	#name : #BrStyleValue,
	#superclass : #Object,
	#instVars : [
		'value',
		'transition',
		'animation'
	],
	#category : 'Brick-Style-Value'
}

{ #category : #'as yet unclassified' }
BrStyleValue class >> em: aValue [
	^ BrEmValue value: aValue 
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> ms: aValue [
	^ BrDurationValue value: aValue ms
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> percent: aValue [
	^ BrPercentValue value: aValue percent
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> pt: aValue [
	^ BrPtValue value: aValue 
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> px: aValue [
	^ BrPixelValue value: aValue px
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> rem: aValue [
	^ BrRemValue value: aValue rem
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> s: aValue [
	^ BrDurationValue value: aValue s
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> value: aValue [
	^ self value: aValue transition: nil
]

{ #category : #'as yet unclassified' }
BrStyleValue class >> value: aValue transition: aTransition [
	^ self new
		value: aValue;
		transition: aTransition;
		yourself
]

{ #category : #'as yet unclassified' }
BrStyleValue >> + anObject [
	^ self value + anObject
]

{ #category : #'as yet unclassified' }
BrStyleValue >> = aStyleValue [
	^ self value = aStyleValue value
]

{ #category : #'as yet unclassified' }
BrStyleValue >> @ anObject [
	^ self value @ anObject
]

{ #category : #accessing }
BrStyleValue >> animation [
	^ animation ifNil: [ animation := self defaultAnimation ]
]

{ #category : #accessing }
BrStyleValue >> animation: anObject [
	animation := anObject
]

{ #category : #accessing }
BrStyleValue >> apply: aValue on: aTarget property: aSymbol [
	aTarget perform: aSymbol asMutator with: aValue
]

{ #category : #accessing }
BrStyleValue >> applyOn: aTarget property: aSymbol [
	| valueToApply |
	valueToApply := self computeValueFrom: aTarget property: aSymbol.
	(self transition isNil or: [ self transition duration = 0 ])
		ifTrue: [ self apply: valueToApply on: aTarget property: aSymbol ]
		ifFalse: [ self transite: valueToApply on: aTarget property: aSymbol ]
]

{ #category : #'as yet unclassified' }
BrStyleValue >> asBrStyleValue [
	^ self
]

{ #category : #accessing }
BrStyleValue >> computeValueFrom: aTarget property: aSymbol [
	^ self 
]

{ #category : #accessing }
BrStyleValue >> defaultAnimation [
	^ BlNumberTransition new
]

{ #category : #'as yet unclassified' }
BrStyleValue >> doesNotUnderstand: aMessage [
	^ aMessage sendTo: self value
]

{ #category : #'as yet unclassified' }
BrStyleValue >> hasTransition [
	^ self transition isNotNil and: [ self transition duration > 0 ]
]

{ #category : #accessing }
BrStyleValue >> initialize [
	super initialize.

]

{ #category : #accessing }
BrStyleValue >> printOn: aStream [
	aStream
		nextPutAll: self className;
		nextPut: $(;
		nextPutAll: self value asString;
		nextPut: $)
]

{ #category : #accessing }
BrStyleValue >> property: aSymbol of: aTarget [
	^ aTarget styler perform: aSymbol
]

{ #category : #accessing }
BrStyleValue >> transite: aValue on: aTarget property: aSymbol [
	| anim |
	anim := self animation
		duration: self transition duration;
		delay: self transition delay;
		from: (self property: aSymbol of: aTarget);
		to: aValue;
		easing:(BlEasing perform:self transition timingFunction);
		onStepDo: [ :v |self apply: v on: aTarget property: aSymbol ].
	anim isRunning ifTrue: [ anim stop ].
	anim start.
]

{ #category : #accessing }
BrStyleValue >> transition [
	^ transition
]

{ #category : #accessing }
BrStyleValue >> transition: anObject [
	transition := anObject
]

{ #category : #accessing }
BrStyleValue >> value [
	^ value
]

{ #category : #accessing }
BrStyleValue >> value: anObject [
	value := anObject
]

{ #category : #'as yet unclassified' }
BrStyleValue >> valueRelativeTo: aTargetProperty [
	^ self value
]
