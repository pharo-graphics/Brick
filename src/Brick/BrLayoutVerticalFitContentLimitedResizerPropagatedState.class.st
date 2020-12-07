Class {
	#name : #BrLayoutVerticalFitContentLimitedResizerPropagatedState,
	#superclass : #BrLayoutVerticalFitContentLimitedResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutVerticalFitContentLimitedResizerPropagatedState >> asNotPropagated [
	^ BrLayoutVerticalResizerState fitContentLimited
]

{ #category : #converting }
BrLayoutVerticalFitContentLimitedResizerPropagatedState >> asPropagated [
	^ self
]

{ #category : #enumerating }
BrLayoutVerticalFitContentLimitedResizerPropagatedState >> optionalOnAddedTo: anElement [
	anElement properties vFitContentLimited
]

{ #category : #printing }
BrLayoutVerticalFitContentLimitedResizerPropagatedState >> printOn: aStream [
	super printOn: aStream.
	aStream space;
		nextPutAll: '(propagated)'
]

{ #category : #testing }
BrLayoutVerticalFitContentLimitedResizerPropagatedState >> shouldOverwriteChildState [
	^ true
]
