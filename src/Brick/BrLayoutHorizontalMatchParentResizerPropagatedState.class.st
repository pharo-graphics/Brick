Class {
	#name : #BrLayoutHorizontalMatchParentResizerPropagatedState,
	#superclass : #BrLayoutHorizontalMatchParentResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutHorizontalMatchParentResizerPropagatedState >> asNotPropagated [
	^ BrLayoutHorizontalResizerState matchParent
]

{ #category : #converting }
BrLayoutHorizontalMatchParentResizerPropagatedState >> asPropagated [
	^ self
]

{ #category : #enumerating }
BrLayoutHorizontalMatchParentResizerPropagatedState >> optionalOnAddedTo: anElement [
	anElement properties hMatchParent
]

{ #category : #printing }
BrLayoutHorizontalMatchParentResizerPropagatedState >> printOn: aStream [
	super printOn: aStream.
	aStream space;
		nextPutAll: '(propagated)'
]

{ #category : #testing }
BrLayoutHorizontalMatchParentResizerPropagatedState >> shouldOverwriteChildState [
	^ true
]
