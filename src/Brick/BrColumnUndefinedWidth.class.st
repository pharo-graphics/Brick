Class {
	#name : #BrColumnUndefinedWidth,
	#superclass : #BrColumnWidth,
	#category : #'Brick-Column - Model'
}

{ #category : #comparing }
BrColumnUndefinedWidth >> = anObject [
	"Answer whether the receiver and anObject represent the same object."
	self == anObject
		ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #hook }
BrColumnUndefinedWidth >> applyOn: anElement [
]

{ #category : #comparing }
BrColumnUndefinedWidth >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash
]
