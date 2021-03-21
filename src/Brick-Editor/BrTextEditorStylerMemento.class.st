Class {
	#name : #BrTextEditorStylerMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'styler'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorStylerMemento >> initialize [
	super initialize.
	
	styler := BlTextNullStyler new
]

{ #category : #evaluating }
BrTextEditorStylerMemento >> label [
	^ 'Styler'
]

{ #category : #accessing }
BrTextEditorStylerMemento >> order [
	^ 40
]

{ #category : #memento }
BrTextEditorStylerMemento >> restoreStateOf: aTextEditor [
	aTextEditor styler: styler
]

{ #category : #memento }
BrTextEditorStylerMemento >> saveStateOf: aTextEditor [
	styler := aTextEditor styler
]

{ #category : #accessing }
BrTextEditorStylerMemento >> styler: anObject [
	styler := anObject
]

{ #category : #evaluating }
BrTextEditorStylerMemento >> value [
	^ styler
]
