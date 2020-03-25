Class {
	#name : #BrEditorAcceptWish,
	#superclass : #BrEditorWish,
	#instVars : [
		'text'
	],
	#category : #'Brick-Editor - Events'
}

{ #category : #accessing }
BrEditorAcceptWish >> text [
	^ text
]

{ #category : #accessing }
BrEditorAcceptWish >> text: anObject [
	text := anObject
]
