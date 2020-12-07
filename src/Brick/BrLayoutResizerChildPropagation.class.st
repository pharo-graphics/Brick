Class {
	#name : #BrLayoutResizerChildPropagation,
	#superclass : #BrLayoutResizerPropagation,
	#instVars : [
		'childElement'
	],
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #accessing }
BrLayoutResizerChildPropagation >> childElement [
	^ childElement
]

{ #category : #accessing }
BrLayoutResizerChildPropagation >> childElement: anObject [
	childElement := anObject
]

{ #category : #'as yet unclassified' }
BrLayoutResizerChildPropagation >> childrenToPropagateFrom: aParentElement do: aBlockClosure [
	aBlockClosure value: self childElement
]
