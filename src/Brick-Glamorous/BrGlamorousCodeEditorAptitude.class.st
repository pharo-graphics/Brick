Class {
	#name : #BrGlamorousCodeEditorAptitude,
	#superclass : #BrGlamorousEditorAptitude,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousCodeEditorAptitude >> initialize [
	super initialize.
	self 
		glamorousCodeFont;
		fontSize: 1 fontEm
]
