Class {
	#name : #BrLayoutResizerElementPropagations,
	#superclass : #BrLayoutResizerPropagations,
	#instVars : [
		'element'
	],
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #'adding / removing' }
BrLayoutResizerElementPropagations >> addPropagation: aBrLayoutResizerPropagation [
	super addPropagation: aBrLayoutResizerPropagation.
	
	self element requestStyle
]

{ #category : #'adding / removing' }
BrLayoutResizerElementPropagations >> addPropagations: aBrLayoutResizerPropagations [
	super addPropagations: aBrLayoutResizerPropagations.
	
	self element requestStyle
]

{ #category : #accessing }
BrLayoutResizerElementPropagations >> element [
	^ element
]

{ #category : #accessing }
BrLayoutResizerElementPropagations >> element: anObject [
	element := anObject
]

{ #category : #'adding / removing' }
BrLayoutResizerElementPropagations >> removePropagation: aBrLayoutResizerPropagation [
	super removePropagation: aBrLayoutResizerPropagation.
	
	self element requestStyle
]

{ #category : #'adding / removing' }
BrLayoutResizerElementPropagations >> removePropagations: aBrLayoutResizerPropagations [
	super removePropagations: aBrLayoutResizerPropagations.
	
	self element requestStyle
]
