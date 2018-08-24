Class {
	#name : #BrLabeledPalette,
	#superclass : #BrColorPalette,
	#instVars : [
		'backgroundColor',
		'borderColor',
		'textColor',
		'icon',
		'text'
	],
	#category : 'Brick-Style'
}

{ #category : #accessing }
BrLabeledPalette >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
BrLabeledPalette >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #accessing }
BrLabeledPalette >> borderColor [
	^ borderColor
]

{ #category : #accessing }
BrLabeledPalette >> borderColor: anObject [
	borderColor := anObject
]

{ #category : #accessing }
BrLabeledPalette >> icon [
	^ icon ifNil: [ icon := BrIconPalette new ]
]

{ #category : #accessing }
BrLabeledPalette >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
BrLabeledPalette >> text [
	^ text ifNil: [ text := BrTextPalette new ]
]

{ #category : #accessing }
BrLabeledPalette >> text: aPalette [
	text := aPalette
]
