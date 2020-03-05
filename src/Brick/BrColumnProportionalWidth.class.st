Class {
	#name : #BrColumnProportionalWidth,
	#superclass : #BrColumnWidth,
	#instVars : [
		'weight'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #comparing }
BrColumnProportionalWidth >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ weight = anObject weight
]

{ #category : #hook }
BrColumnProportionalWidth >> applyOn: anElement [
	anElement constraintsDo: [ :c |
		c horizontal matchParent.
		c linear weight: self weight.
		c frame horizontal weight: self weight ].
	anElement dispatchEvent: (BrLayoutHorizontalResizerWish matchParent)
]

{ #category : #comparing }
BrColumnProportionalWidth >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ weight hash
]

{ #category : #initialization }
BrColumnProportionalWidth >> initialize [
	super initialize.
	
	weight := 1.0
]

{ #category : #accessing }
BrColumnProportionalWidth >> weight [
	<return: #Number>

	^ weight
]

{ #category : #accessing }
BrColumnProportionalWidth >> weight: aNumber [
	weight := aNumber
]
