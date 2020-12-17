Class {
	#name : #BrLayoutResizerPropagation,
	#superclass : #Object,
	#instVars : [
		'associations'
	],
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #accessing }
BrLayoutResizerPropagation >> childrenToPropagateFrom: aParentElement do: aBlockClosure [
	self subclassResponsibility
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagation >> from: aFromLayoutResizerState to: aToLayoutResizerState [
	associations add: (aFromLayoutResizerState -> aToLayoutResizerState)
]

{ #category : #'api - to match parent' }
BrLayoutResizerPropagation >> fromAll: aFromLayoutResizerStates to: aToLayoutResizerState [	
	aFromLayoutResizerStates do: [ :eachLayoutResizerStates | self from: eachLayoutResizerStates to: aToLayoutResizerState ]
]

{ #category : #initialization }
BrLayoutResizerPropagation >> initialize [
	super initialize.
	
	associations := OrderedCollection new
]

{ #category : #accessing }
BrLayoutResizerPropagation >> propagationAssociations [
	^ associations
]
