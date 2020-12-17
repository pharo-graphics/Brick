Class {
	#name : #BrLayoutVerticalFitContentResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #comparing }
BrLayoutVerticalFitContentResizerState >> = anotherState [
	^ anotherState isKindOf: BrLayoutVerticalFitContentResizerState
]

{ #category : #converting }
BrLayoutVerticalFitContentResizerState >> asPropagated [
	^ BrLayoutVerticalFitContentResizerPropagatedState uniqueInstance
]

{ #category : #comparing }
BrLayoutVerticalFitContentResizerState >> hash [
	^ BrLayoutVerticalFitContentResizerState hash
]

{ #category : #printing }
BrLayoutVerticalFitContentResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'fit content'
]
