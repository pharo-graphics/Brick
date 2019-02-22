Class {
	#name : #BrEditorTextChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'text'
	],
	#category : #'Brick-Editor - Events'
}

{ #category : #accessing }
BrEditorTextChanged class >> text: aText [
	^ self new text: aText
]

{ #category : #accessing }
BrEditorTextChanged >> text [
	^ text
]

{ #category : #accessing }
BrEditorTextChanged >> text: anObject [
	text := anObject
]
