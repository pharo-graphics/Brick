Class {
	#name : #BrGlamorousCodeEditorLook,
	#superclass : #BrGlamorousEditorLook,
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousCodeEditorLook >> initialize [
	super initialize.
	self 
		fontName: 'Source Code Pro';
		fontSize: 14
]
