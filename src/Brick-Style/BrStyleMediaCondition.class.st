Class {
	#name : #BrStyleMediaCondition,
	#superclass : #Object,
	#instVars : [
		'type',
		'conditions',
		'media'
	],
	#category : 'Brick-Style-CSS'
}

{ #category : #accessing }
BrStyleMediaCondition >> conditions [
	^ conditions
]

{ #category : #accessing }
BrStyleMediaCondition >> conditions: anObject [
	conditions := anObject
]

{ #category : #'evaluating conditions' }
BrStyleMediaCondition >> heightOf: aTarget value: aValue [
	^ aTarget height = aValue
]

{ #category : #testing }
BrStyleMediaCondition >> isValidOn: aTarget [
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
]

{ #category : #'evaluating conditions' }
BrStyleMediaCondition >> maxHeightOf: aTarget value: aValue [
	^ aTarget height <= aValue
]

{ #category : #'evaluating conditions' }
BrStyleMediaCondition >> maxWidthOf: aTarget value: aValue [
	^ aTarget width <= aValue
]

{ #category : #accessing }
BrStyleMediaCondition >> media [
	^ media
]

{ #category : #accessing }
BrStyleMediaCondition >> media: anObject [
	media := anObject
]

{ #category : #'evaluating conditions' }
BrStyleMediaCondition >> minHeightOf: aTarget value: aValue [
	^ aTarget height >= aValue
]

{ #category : #'evaluating conditions' }
BrStyleMediaCondition >> minWidthOf: aTarget value: aValue [
	^ aTarget width >= aValue
]

{ #category : #accessing }
BrStyleMediaCondition >> type [
	^ type
]

{ #category : #accessing }
BrStyleMediaCondition >> type: anObject [
	type := anObject
]

{ #category : #'evaluating conditions' }
BrStyleMediaCondition >> widthOf: aTarget value: aValue [
	^ aTarget width = aValue
]
