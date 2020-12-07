Class {
	#name : #BrLayoutHorizontalFitContentResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #comparing }
BrLayoutHorizontalFitContentResizerState >> = anotherState [
	^ anotherState isKindOf: BrLayoutHorizontalFitContentResizerState
]

{ #category : #converting }
BrLayoutHorizontalFitContentResizerState >> asPropagated [
	^ BrLayoutHorizontalFitContentResizerPropagatedState uniqueInstance
]

{ #category : #comparing }
BrLayoutHorizontalFitContentResizerState >> hash [
	^ BrLayoutHorizontalFitContentResizerState hash
]

{ #category : #printing }
BrLayoutHorizontalFitContentResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'fit content'
]
