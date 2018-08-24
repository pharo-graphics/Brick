Class {
	#name : #BrOnClickHandler,
	#superclass : #BlEventHandler,
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrOnClickHandler class >> do: aBlock [
	^ self new
		action: aBlock;
		yourself
]

{ #category : #'as yet unclassified' }
BrOnClickHandler >> eventClass [ 
 ^ BlClickEvent 
]
