Class {
	#name : #BrLayoutVerticalMatchParentResizerPropagatedState,
	#superclass : #BrLayoutVerticalMatchParentResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #converting }
BrLayoutVerticalMatchParentResizerPropagatedState >> asNotPropagated [
	^ BrLayoutVerticalResizerState matchParent
]

{ #category : #converting }
BrLayoutVerticalMatchParentResizerPropagatedState >> asPropagated [
	^ self
]

{ #category : #enumerating }
BrLayoutVerticalMatchParentResizerPropagatedState >> optionalOnAddedTo: anElement [
	anElement properties vMatchParent
]

{ #category : #printing }
BrLayoutVerticalMatchParentResizerPropagatedState >> printOn: aStream [
	super printOn: aStream.
	aStream space;
		nextPutAll: '(propagated)'
]

{ #category : #testing }
BrLayoutVerticalMatchParentResizerPropagatedState >> shouldOverwriteChildState [
	^ true
]
