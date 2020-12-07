Class {
	#name : #BrLayoutVerticalFitContentResizerPropagatedState,
	#superclass : #BrLayoutVerticalFitContentResizerState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutVerticalFitContentResizerPropagatedState >> asNotPropagated [
	^ BrLayoutVerticalResizerState fitContent
]

{ #category : #converting }
BrLayoutVerticalFitContentResizerPropagatedState >> asPropagated [
	^ self
]

{ #category : #enumerating }
BrLayoutVerticalFitContentResizerPropagatedState >> optionalOnAddedTo: anElement [
	anElement properties vFitContent
]

{ #category : #printing }
BrLayoutVerticalFitContentResizerPropagatedState >> printOn: aStream [
	super printOn: aStream.
	aStream space;
		nextPutAll: '(propagated)'
]

{ #category : #testing }
BrLayoutVerticalFitContentResizerPropagatedState >> shouldOverwriteChildState [
	^ true
]
