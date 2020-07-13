Class {
	#name : #BrTextEditorMemento,
	#superclass : #Object,
	#instVars : [
		'text',
		'cursor',
		'selection',
		'styler',
		'filter',
		'history',
		'shortcuts',
		'mode'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #accessing }
BrTextEditorMemento >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorMemento >> cursor: anObject [
	cursor := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> filter [
	^ filter
]

{ #category : #accessing }
BrTextEditorMemento >> filter: anObject [
	filter := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> history [
	^ history
]

{ #category : #accessing }
BrTextEditorMemento >> history: anObject [
	history := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> mode [
	^ mode
]

{ #category : #accessing }
BrTextEditorMemento >> mode: anObject [
	mode := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> selection [
	^ selection
]

{ #category : #accessing }
BrTextEditorMemento >> selection: anObject [
	selection := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> shortcuts [
	^ shortcuts
]

{ #category : #accessing }
BrTextEditorMemento >> shortcuts: anObject [
	shortcuts := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> styler [
	^ styler
]

{ #category : #accessing }
BrTextEditorMemento >> styler: anObject [
	styler := anObject
]

{ #category : #accessing }
BrTextEditorMemento >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorMemento >> text: anObject [
	text := anObject
]
