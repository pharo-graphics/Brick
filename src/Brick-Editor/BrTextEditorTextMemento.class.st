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

{ #category : #testing }
BrTextEditorTextMemento >> isTextMemento [
	^ true
]

{ #category : #evaluating }
BrTextEditorTextMemento >> label [
	^ 'Text'
]

{ #category : #accessing }
BrTextEditorTextMemento >> order [
	^ 60
]

{ #category : #memento }
BrTextEditorTextMemento >> restoreStateOf: aTextEditor [
	aTextEditor restoreText: text copy
]

{ #category : #memento }
BrTextEditorTextMemento >> saveStateOf: aTextEditor [
	text := aTextEditor text copy
]

{ #category : #accessing }
BrTextEditorTextMemento >> text [
	^ text
]

{ #category : #evaluating }
BrTextEditorTextMemento >> value [
	^ text copyWithoutExternalReferences
]
