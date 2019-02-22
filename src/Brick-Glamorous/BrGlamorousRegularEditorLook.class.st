Class {
	#name : #BrGlamorousRegularEditorLook,
	#superclass : #BrGlamorousEditorLook,
	#pools : [
		'BrGlamorousColors'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousRegularEditorLook >> initialize [
	super initialize.
	self 
		fontName: 'Source Sans Pro';
		fontSize: 14
]
