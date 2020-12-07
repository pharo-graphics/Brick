Class {
	#name : #BrLayoutHorizontalFitContentLimitedResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #comparing }
BrLayoutHorizontalFitContentLimitedResizerState >> = anotherState [
	^ anotherState isKindOf: BrLayoutHorizontalFitContentLimitedResizerState
]

{ #category : #converting }
BrLayoutHorizontalFitContentLimitedResizerState >> asPropagated [
	^ BrLayoutHorizontalFitContentLimitedResizerPropagatedState uniqueInstance
]

{ #category : #comparing }
BrLayoutHorizontalFitContentLimitedResizerState >> hash [
	^ BrLayoutHorizontalFitContentLimitedResizerState hash
]

{ #category : #printing }
BrLayoutHorizontalFitContentLimitedResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'fit content limited'
]
