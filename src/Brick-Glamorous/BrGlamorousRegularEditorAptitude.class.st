Class {
	#name : #BrGlamorousRegularEditorAptitude,
	#superclass : #BrGlamorousEditorAptitude,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousRegularEditorAptitude >> initialize [
	super initialize.
	self 
		glamorousRegularFont;
		fontSize: 1 fontEm
]
