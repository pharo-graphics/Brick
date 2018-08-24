Class {
	#name : #BrColorPalette,
	#superclass : #Object,
	#instVars : [
		'hovered',
		'disabled',
		'pressed'
	],
	#category : 'Brick-Style'
}

{ #category : #accessing }
BrColorPalette >> disabled [
	^ disabled ifNil: [ disabled := self class new ]
]

{ #category : #accessing }
BrColorPalette >> disabled: aPalette [
	disabled := aPalette
]

{ #category : #accessing }
BrColorPalette >> hovered [
	^ hovered  ifNil: [ hovered := self class new ]
]

{ #category : #accessing }
BrColorPalette >> hovered: aPalette [
	hovered := aPalette
]

{ #category : #accessing }
BrColorPalette >> pressed [
	^ pressed  ifNil: [ pressed := self class new ]
]

{ #category : #accessing }
BrColorPalette >> pressed: anObject [
	pressed := anObject
]
