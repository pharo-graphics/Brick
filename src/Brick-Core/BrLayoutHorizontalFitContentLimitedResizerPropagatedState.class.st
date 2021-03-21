Class {
	#name : #BrLayoutHorizontalFitContentLimitedResizerPropagatedState,
	#superclass : #BrLayoutHorizontalFitContentLimitedResizerState,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #converting }
BrLayoutHorizontalFitContentLimitedResizerPropagatedState >> asNotPropagated [
	^ BrLayoutHorizontalResizerState fitContentLimited
]

{ #category : #converting }
BrLayoutHorizontalFitContentLimitedResizerPropagatedState >> asPropagated [
	^ self
]

{ #category : #enumerating }
BrLayoutHorizontalFitContentLimitedResizerPropagatedState >> optionalOnAddedTo: anElement [
	anElement properties hFitContentLimited
]

{ #category : #printing }
BrLayoutHorizontalFitContentLimitedResizerPropagatedState >> printOn: aStream [
	super printOn: aStream.
	aStream space;
		nextPutAll: '(propagated)'
]

{ #category : #testing }
BrLayoutHorizontalFitContentLimitedResizerPropagatedState >> shouldOverwriteChildState [
	^ true
]
