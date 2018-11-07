Class {
	#name : #BrLayoutResizerRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Layout Resizer - Events'
}

{ #category : #initialization }
BrLayoutResizerRequest >> responseClass [
	^ self subclassResponsibility
]
