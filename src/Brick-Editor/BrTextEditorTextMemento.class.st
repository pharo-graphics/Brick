Class {
	#name : #BrTextEditorTextMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'text'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorTextMemento >> initialize [
	super initialize.
	
	text := '' asRopedText
]

{ #category : #accessing }
BrTextEditorTextMemento >> order [
	^ 60
]

{ #category : #memento }
BrTextEditorTextMemento >> restoreStateOf: aTextEditor [
	aTextEditor text: text copy
]

{ #category : #memento }
BrTextEditorTextMemento >> saveStateOf: aTextEditor [
	text := aTextEditor text copy
]
