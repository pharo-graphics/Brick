Class {
	#name : #BrAnchoredSingleStrategyBuilder,
	#superclass : #BrAnchoredStrategyBuilder,
	#instVars : [
		'availableBounds',
		'referencePoint',
		'anchorBounds',
		'scaleFactor',
		'apply'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #accessing }
BrAnchoredSingleStrategyBuilder >> anchorBounds: anObject [
	anchorBounds := anObject asBrAnchoredAnchorBounds
]

{ #category : #accessing }
BrAnchoredSingleStrategyBuilder >> apply: aBlock [
	apply := aBlock
]

{ #category : #accessing }
BrAnchoredSingleStrategyBuilder >> availableBounds: anObject [
	availableBounds := anObject asBrAnchoredAvailableBounds
]

{ #category : #building }
BrAnchoredSingleStrategyBuilder >> build [
	^ BrAnchoredSingleStrategy
		anchorBounds: anchorBounds
		referencePoint: referencePoint
		availableBounds: availableBounds
		scaleFactor: scaleFactor
		apply: apply
]

{ #category : #initialization }
BrAnchoredSingleStrategyBuilder >> initialize [
	super initialize.
	scaleFactor := 1 asBrAnchoredScaleFactor.
	apply := [  ]
]

{ #category : #accessing }
BrAnchoredSingleStrategyBuilder >> referencePoint: anObject [
	referencePoint := anObject asBrAnchoredReferencePoint
]

{ #category : #accessing }
BrAnchoredSingleStrategyBuilder >> scaleFactor: anObject [
	scaleFactor := anObject asBrAnchoredScaleFactor
]
