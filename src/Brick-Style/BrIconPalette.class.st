Class {
	#name : #BrIconPalette,
	#superclass : #BrColorPalette,
	#instVars : [
		'backgroundColor'
	],
	#category : 'Brick-Style'
}

{ #category : #accessing }
BrIconPalette >> backgroundColor [
	^ backgroundColor
]

{ #category : #accessing }
BrIconPalette >> backgroundColor: anObject [
	backgroundColor := anObject
]
