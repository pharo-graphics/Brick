Class {
	#name : #BrTooltipRelocateWish,
	#superclass : #BrAnchoredRelocateWish,
	#category : #'Brick-Tooltip - Events'
}

{ #category : #'as yet unclassified' }
BrTooltipRelocateWish class >> anchor: anElement container: anotherElement [
	^ self new
		anchor: anElement;
		container: anotherElement;
		yourself
]

{ #category : #converting }
BrTooltipRelocateWish >> asRelocation [
	^ true
]
