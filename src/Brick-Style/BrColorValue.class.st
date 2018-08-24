Class {
	#name : #BrColorValue,
	#superclass : #BrStyleValue,
	#category : 'Brick-Style-Value'
}

{ #category : #'as yet unclassified' }
BrColorValue >> defaultAnimation [
	^ BlColorTransition new 
]
