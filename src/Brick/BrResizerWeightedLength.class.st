Class {
	#name : #BrResizerWeightedLength,
	#superclass : #BrResizerElementLength,
	#instVars : [
		'weight'
	],
	#category : #'Brick-Resizer - Support'
}

{ #category : #'api - size' }
BrResizerWeightedLength >> adjustHeightFor: anElement [
	"Set element height"
	anElement
		constraintsDo: [ :c | 
			c vertical matchParent.
			c frame vertical weight: self weight.
			c linear weight: self weight. ].
	
	anElement states addState: BrLayoutVerticalResizerState matchParent.
]

{ #category : #'api - size' }
BrResizerWeightedLength >> adjustWidthFor: anElement [
	"Set element width"
	anElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c frame horizontal weight: self weight.
			c linear weight: self weight. ].

	anElement states addState: BrLayoutHorizontalResizerState matchParent.
]

{ #category : #asserting }
BrResizerWeightedLength >> assertWeight: aNumber [
	self 
		assert: [ aNumber isNotNil ] 
		description: [ 'Weight must be non-nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Weight must be non-negative' ].
]

{ #category : #defaults }
BrResizerWeightedLength >> defaultWeight [
	^ 0.5
]

{ #category : #initialization }
BrResizerWeightedLength >> initialize [
	super initialize.
	weight := self defaultWeight.
]

{ #category : #accessing }
BrResizerWeightedLength >> weight [
	<return: #Number>
	^ weight
]

{ #category : #accessing }
BrResizerWeightedLength >> weight: aNumber [
	self assertWeight: aNumber.
	weight := aNumber
]
