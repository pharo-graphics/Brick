Class {
	#name : #BrDropdownRelocateWish,
	#superclass : #BrAnchoredRelocateWish,
	#category : #'Brick-Dropdown - Events'
}

{ #category : #'as yet unclassified' }
BrDropdownRelocateWish class >> anchor: anElement container: anotherElement [
	^ self new
		anchor: anElement;
		container: anotherElement;
		yourself
]

{ #category : #converting }
BrDropdownRelocateWish >> asRelocation [
	^ true
]
