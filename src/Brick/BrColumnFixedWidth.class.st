Class {
	#name : #BrColumnFixedWidth,
	#superclass : #BrColumnWidth,
	#instVars : [
		'width'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #comparing }
BrColumnFixedWidth >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ width = anObject width
]

{ #category : #hook }
BrColumnFixedWidth >> applyOn: anElement [
	anElement width: self width.
	anElement states addState: (BrLayoutHorizontalResizerState exact)
]

{ #category : #comparing }
BrColumnFixedWidth >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ width hash
]

{ #category : #initialization }
BrColumnFixedWidth >> initialize [
	super initialize.
	
	width := 200
]

{ #category : #accessing }
BrColumnFixedWidth >> width [
	<return: #Number>

	^ width
]

{ #category : #accessing }
BrColumnFixedWidth >> width: aNumber [
	width := aNumber
]
