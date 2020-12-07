Class {
	#name : #BrLayoutResizerDynamicPropagation,
	#superclass : #BrLayoutResizerPropagation,
	#instVars : [
		'childrenBlock'
	],
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #accessing }
BrLayoutResizerDynamicPropagation >> childrenBlock [
	^ childrenBlock
]

{ #category : #accessing }
BrLayoutResizerDynamicPropagation >> childrenBlock: anObject [
	childrenBlock := anObject
]

{ #category : #accessing }
BrLayoutResizerDynamicPropagation >> childrenToPropagateFrom: aParentElement do: aBlockClosure [
	childrenBlock argumentCount isZero
		ifTrue: [
			| theChildElements |
			
			theChildElements := childrenBlock cull: aParentElement.
			theChildElements isCollection
				ifTrue: [ theChildElements do: aBlockClosure ]
				ifFalse: [ aBlockClosure value: theChildElements ] ]
		ifFalse: [ childrenBlock value: aBlockClosure ]
]
