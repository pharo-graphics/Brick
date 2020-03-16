Class {
	#name : #BrTextEditorModifiedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'text'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorModifiedEvent >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorModifiedEvent >> text: anObject [
	text := anObject
]
