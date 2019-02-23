Class {
	#name : #BrGlamorousEditorLook,
	#superclass : #BrEditorLook,
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousEditorLook >> initialize [
	super initialize.

	self
		foreground: (Color r: 36 g: 41 b: 46 range: 255);
		spacing: 0.4
]
