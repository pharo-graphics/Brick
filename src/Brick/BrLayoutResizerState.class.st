Class {
	#name : #BrLayoutResizerState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #converting }
BrLayoutResizerState >> asNotPropagated [
	^ self
]

{ #category : #converting }
BrLayoutResizerState >> asPropagated [
	^ self subclassResponsibility
]

{ #category : #propagation }
BrLayoutResizerState >> finishedPropagateFrom: aParentElement [
	aParentElement layoutResizerPropagations clearPropagationRules: aParentElement
]

{ #category : #propagation }
BrLayoutResizerState >> prepareToPropagateFrom: aParentElement [
	aParentElement layoutResizerPropagations precomputePropagationRules: aParentElement
]

{ #category : #accessing }
BrLayoutResizerState >> priority [
	^ UserPriority
]

{ #category : #propagation }
BrLayoutResizerState >> propagatedStateFrom: aParentElement to: aChildElement [
	"Return a state that should be propagated from a given parent element to the child instead of me"
	<return: #BlElementState>

	^ aParentElement layoutResizerPropagations
		propagateState: self
		from: aParentElement
		to: aChildElement
]

{ #category : #testing }
BrLayoutResizerState >> shouldPropagateToChildren [
	^ true
]
