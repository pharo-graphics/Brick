Class {
	#name : #BrLayoutHorizontalMatchParentResizerState,
	#superclass : #BrLayoutHorizontalResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #comparing }
BrLayoutHorizontalMatchParentResizerState >> = anotherState [
	^ anotherState isKindOf: BrLayoutHorizontalMatchParentResizerState
]

{ #category : #converting }
BrLayoutHorizontalMatchParentResizerState >> asPropagated [
	^ BrLayoutHorizontalMatchParentResizerPropagatedState uniqueInstance
]

{ #category : #comparing }
BrLayoutHorizontalMatchParentResizerState >> hash [
	^ BrLayoutHorizontalMatchParentResizerState hash
]

{ #category : #printing }
BrLayoutHorizontalMatchParentResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'match parent'
]
