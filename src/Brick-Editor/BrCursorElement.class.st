Class {
	#name : #BrCursorElement,
	#superclass : #BlElement,
	#instVars : [
		'textPosition'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #initialization }
BrCursorElement >> initialize [
	super initialize.
	
	textPosition := 0
]

{ #category : #accessing }
BrCursorElement >> textPosition [
	^ textPosition
]

{ #category : #accessing }
BrCursorElement >> textPosition: anObject [
	textPosition := anObject
]
