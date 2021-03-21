Class {
	#name : #BrLayoutHorizontalFitContentResizerPropagatedState,
	#superclass : #BrLayoutHorizontalFitContentResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #converting }
BrLayoutHorizontalFitContentResizerPropagatedState >> asNotPropagated [
	^ BrLayoutHorizontalResizerState fitContent
]

{ #category : #converting }
BrLayoutHorizontalFitContentResizerPropagatedState >> asPropagated [
	^ self
]

{ #category : #enumerating }
BrLayoutHorizontalFitContentResizerPropagatedState >> optionalOnAddedTo: anElement [
	anElement properties hFitContent
]

{ #category : #printing }
BrLayoutHorizontalFitContentResizerPropagatedState >> printOn: aStream [
	super printOn: aStream.
	aStream space;
		nextPutAll: '(propagated)'
]

{ #category : #testing }
BrLayoutHorizontalFitContentResizerPropagatedState >> shouldOverwriteChildState [
	^ true
]
