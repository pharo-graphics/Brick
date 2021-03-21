Class {
	#name : #BrTextEditorModeMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'mode'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorModeMemento >> initialize [
	super initialize.
	
	mode := BrTextEditorEditableMode new
]

{ #category : #evaluating }
BrTextEditorModeMemento >> label [
	^ 'Mode'
]

{ #category : #accessing }
BrTextEditorModeMemento >> order [
	^ 20
]

{ #category : #memento }
BrTextEditorModeMemento >> restoreStateOf: aTextEditor [
	aTextEditor editorMode: mode copy
]

{ #category : #memento }
BrTextEditorModeMemento >> saveStateOf: aTextEditor [
	mode := aTextEditor editorMode copy
]

{ #category : #evaluating }
BrTextEditorModeMemento >> value [
	^ mode
]
