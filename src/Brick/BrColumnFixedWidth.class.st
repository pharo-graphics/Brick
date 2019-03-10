Class {
	#name : #BrColumnFixedWidth,
	#superclass : #BrColumnWidth,
	#instVars : [
		'width'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #hook }
BrColumnFixedWidth >> applyOn: anElement [
	anElement width: self width.
	anElement dispatchEvent: (BrLayoutHorizontalResizerWish exact: self width)
]

{ #category : #initialization }
BrColumnFixedWidth >> initialize [
	super initialize.
	
	width := 200
]

{ #category : #accessing }
BrColumnFixedWidth >> width [
	^ width
]

{ #category : #accessing }
BrColumnFixedWidth >> width: anObject [
	width := anObject
]
