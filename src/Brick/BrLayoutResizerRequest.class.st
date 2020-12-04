Class {
	#name : #BrLayoutResizerRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrLayoutResizerRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutResizerRequest >> responseClass [
	^ self subclassResponsibility
]
