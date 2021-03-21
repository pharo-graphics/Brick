Class {
	#name : #BrTextEditorTextReplacedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'text'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorTextReplacedEvent >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorTextReplacedEvent >> text: anObject [
	text := anObject
]
