Class {
	#name : #BrLayoutResizerChildrenPropagation,
	#superclass : #BrLayoutResizerPropagation,
	#instVars : [
		'childrenElements'
	],
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #accessing }
BrLayoutResizerChildrenPropagation >> childrenElements [
	^ childrenElements
]

{ #category : #accessing }
BrLayoutResizerChildrenPropagation >> childrenElements: anObject [
	childrenElements := anObject
]

{ #category : #'as yet unclassified' }
BrLayoutResizerChildrenPropagation >> childrenToPropagateFrom: aParentElement do: aBlockClosure [
	self childrenElements do: aBlockClosure
]
