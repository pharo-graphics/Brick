Class {
	#name : #BrColumnProportionalWidth,
	#superclass : #BrColumnWidth,
	#instVars : [
		'weight'
	],
	#category : #'Brick-Column - Model'
}

{ #category : #hook }
BrColumnProportionalWidth >> applyOn: anElement [
	anElement constraintsDo: [ :c |
		c horizontal matchParent.
		c linear weight: self weight ].
	anElement dispatchEvent: (BrLayoutHorizontalResizerWish matchParent)
]

{ #category : #initialization }
BrColumnProportionalWidth >> initialize [
	super initialize.
	
	weight := 1
]

{ #category : #accessing }
BrColumnProportionalWidth >> weight [
	^ weight
]

{ #category : #accessing }
BrColumnProportionalWidth >> weight: anObject [
	weight := anObject
]
