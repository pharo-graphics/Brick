Class {
	#name : #BrLayoutResizerRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Layout Resizer - Events'
}

{ #category : #testing }
BrLayoutResizerRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrLayoutResizerRequest >> responseClass [
	^ self subclassResponsibility
]
