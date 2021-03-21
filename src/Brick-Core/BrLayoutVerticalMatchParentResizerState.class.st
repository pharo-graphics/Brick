Class {
	#name : #BrLayoutVerticalMatchParentResizerState,
	#superclass : #BrLayoutVerticalResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #comparing }
BrLayoutVerticalMatchParentResizerState >> = anotherState [
	^ anotherState isKindOf: BrLayoutVerticalMatchParentResizerState
]

{ #category : #converting }
BrLayoutVerticalMatchParentResizerState >> asPropagated [
	^ BrLayoutVerticalMatchParentResizerPropagatedState uniqueInstance
]

{ #category : #comparing }
BrLayoutVerticalMatchParentResizerState >> hash [
	^ BrLayoutVerticalMatchParentResizerState hash
]

{ #category : #printing }
BrLayoutVerticalMatchParentResizerState >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: 'match parent'
]
