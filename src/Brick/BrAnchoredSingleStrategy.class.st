Class {
	#name : #BrAnchoredSingleStrategy,
	#superclass : #BrAnchoredStrategy,
	#instVars : [
		'availableBounds',
		'referencePoint',
		'anchorBounds',
		'scaleFactor',
		'apply'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredSingleStrategy class >> anchorBounds: anAnchorBounds referencePoint: aReferencePoint availableBounds: anAvailableBounds scaleFactor: aScaleFactor apply: aBlock [
	^ self new
		initializeAnchorBounds: anAnchorBounds
			referencePoint: aReferencePoint
			availableBounds: anAvailableBounds
			scaleFactor: aScaleFactor
			apply: aBlock;
		yourself
]

{ #category : #accessing }
BrAnchoredSingleStrategy class >> builder [
	^ BrAnchoredSingleStrategyBuilder new
]

{ #category : #accessing }
BrAnchoredSingleStrategy >> availableBoundsIn: aReferenceElement forPreferredExtent: aPoint [
	^ availableBounds
		in: aReferenceElement bounds inLocal
		from: (referencePoint from: (anchorBounds boundsIn: aReferenceElement))
]

{ #category : #initialization }
BrAnchoredSingleStrategy >> initializeAnchorBounds: anAnchorBounds referencePoint: aReferencePoint availableBounds: anAvailableBounds scaleFactor: aScaleFactor apply: aBlock [
	self assert: [ anchorBounds isNil ].
	self assert: [ referencePoint isNil ].
	self assert: [ availableBounds isNil ].
	self assert: [ scaleFactor isNil ].
	self assert: [ apply isNil ].
	anchorBounds := anAnchorBounds.
	referencePoint := aReferencePoint.
	availableBounds := anAvailableBounds.
	scaleFactor := aScaleFactor.
	apply := aBlock
]

{ #category : #accessing }
BrAnchoredSingleStrategy >> invalidate: anElement forPreferredExtent: aPoint [
	| bounds factor |
	self assert: [ anElement hasParent ].
	bounds := self
		availableBoundsIn: anElement parent
		forPreferredExtent: aPoint.
	factor := scaleFactor factorIn: anElement parent.
	anElement
		size: bounds extent / factor;
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				scaleBy: factor;
				translateBy: bounds topLeft ].
	apply
		cull:
			(anElement
				parentBoundsToLocal: (BlBounds origin: bounds referencePoint corner: bounds referencePoint))
				topLeft
		cull: anElement
]
