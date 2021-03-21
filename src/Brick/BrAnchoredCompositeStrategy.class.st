Class {
	#name : #BrAnchoredCompositeStrategy,
	#superclass : #BrAnchoredStrategy,
	#instVars : [
		'strategies'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredCompositeStrategy class >> builder [
	^ BrAnchoredCompositeStrategyBuilder new
]

{ #category : #'as yet unclassified' }
BrAnchoredCompositeStrategy class >> strategies: anOrderedCollection [
	^ self new
		initializeStrategies: anOrderedCollection;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredCompositeStrategy >> availableBoundsIn: aReferenceElement forPreferredExtent: aPoint [
	^ (self strategyIn: aReferenceElement forPreferredExtent: aPoint)
		availableBoundsIn: aReferenceElement
		forPreferredExtent: aPoint
]

{ #category : #initialization }
BrAnchoredCompositeStrategy >> initializeStrategies: anOrderedCollection [
	self assert: [ strategies isNil ].
	self assert: [ anOrderedCollection isNotEmpty ].
	strategies := anOrderedCollection
]

{ #category : #accessing }
BrAnchoredCompositeStrategy >> invalidate: anElement forPreferredExtent: aPoint [
	(self strategyIn: anElement parent forPreferredExtent: aPoint)
		invalidate: anElement
		forPreferredExtent: aPoint
]

{ #category : #'as yet unclassified' }
BrAnchoredCompositeStrategy >> strategyIn: aReferenceElement forPreferredExtent: aPoint [
	| preferredRectangle maxAreaBounds maxAreaStrategy |
	preferredRectangle := Rectangle origin: 0.0@0.0 extent: aPoint.
	maxAreaBounds := nil.
	^ strategies
		detect: [ :e | 
			| bounds rectangle |
			bounds := e
				availableBoundsIn: aReferenceElement
				forPreferredExtent: aPoint.
			rectangle := Rectangle origin: 0.0@0.0 extent: bounds extent.
			(maxAreaBounds isNil
				or: [ rectangle area > maxAreaBounds asRectangle area ])
				ifTrue: [ maxAreaBounds := bounds.
					maxAreaStrategy := e ].
			(rectangle intersect: preferredRectangle) = preferredRectangle ]
		ifNone: [ maxAreaStrategy ]
]
