Class {
	#name : #BrAnchoredRelocateWish,
	#superclass : #BrAnchoredWish,
	#category : #'Brick-Anchored - Events'
}

{ #category : #'as yet unclassified' }
BrAnchoredRelocateWish class >> anchor: anElement container: anotherElement [
	^ self new
		anchor: anElement;
		container: anotherElement;
		yourself
]

{ #category : #converting }
BrAnchoredRelocateWish >> asRelocation [
	self subclassResponsibility
]
