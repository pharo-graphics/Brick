Class {
	#name : #BrTextPalette,
	#superclass : #BrColorPalette,
	#instVars : [
		'color'
	],
	#category : 'Brick-Style'
}

{ #category : #accessing }
BrTextPalette >> color [
	^ color
]

{ #category : #accessing }
BrTextPalette >> color: anObject [
	color := anObject
]
