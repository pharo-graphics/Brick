Class {
	#name : #BrTextEditorSelectionMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'selection'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorSelectionMemento >> initialize [
	super initialize.
	
	selection := BlCompositeSelection new
]

{ #category : #evaluating }
BrTextEditorSelectionMemento >> label [
	^ 'Selection'
]

{ #category : #accessing }
BrTextEditorSelectionMemento >> order [
	^ 70
]

{ #category : #memento }
BrTextEditorSelectionMemento >> restoreStateOf: aTextEditor [
	aTextEditor deselecter all deselect.

	aTextEditor selecter
		withoutCursorUpdate;
		all: selection;
		select
]

{ #category : #memento }
BrTextEditorSelectionMemento >> saveStateOf: aTextEditor [
	selection := aTextEditor selection copy.
]

{ #category : #accessing }
BrTextEditorSelectionMemento >> selection [
	^ selection
]

{ #category : #accessing }
BrTextEditorSelectionMemento >> selection: anObject [
	selection := anObject
]

{ #category : #evaluating }
BrTextEditorSelectionMemento >> value [
	^ selection
]
