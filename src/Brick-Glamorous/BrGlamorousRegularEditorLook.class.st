Class {
	#name : #BrGlamorousRegularEditorLook,
	#superclass : #BrGlamorousEditorLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousRegularEditorLook >> initialize [
	super initialize.
	self 
		glamorousRegularFont;
		fontSize: 14
]
