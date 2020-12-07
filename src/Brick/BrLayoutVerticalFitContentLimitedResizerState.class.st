Class {
	#name : #BrLayoutVerticalFitContentLimitedResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #comparing }
BrLayoutVerticalFitContentLimitedResizerState >> = anotherState [
	^ anotherState isKindOf: BrLayoutVerticalFitContentLimitedResizerState
]

{ #category : #converting }
BrLayoutVerticalFitContentLimitedResizerState >> asPropagated [
	^ BrLayoutVerticalFitContentLimitedResizerPropagatedState uniqueInstance
]

{ #category : #comparing }
BrLayoutVerticalFitContentLimitedResizerState >> hash [
	^ BrLayoutVerticalFitContentLimitedResizerState hash
]

{ #category : #printing }
BrLayoutVerticalFitContentLimitedResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'fit content limited'
]
