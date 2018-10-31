Class {
	#name : #BrResizerLocation,
	#superclass : #Object,
	#category : #'Brick-Resizer - State'
}

{ #category : #comparing }
BrResizerLocation >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
BrResizerLocation >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash
]

{ #category : #'instance creation' }
BrResizerLocation >> newResizerListener [
	^ self subclassResponsibility
]
