Class {
	#name : #BrTextEditorHistoryMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'history'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorHistoryMemento >> initialize [
	super initialize.
	
	history := BrTextEditorHistory new
]

{ #category : #accessing }
BrTextEditorHistoryMemento >> order [
	^ 30
]

{ #category : #memento }
BrTextEditorHistoryMemento >> restoreStateOf: aTextEditor [
	aTextEditor history: history
]

{ #category : #memento }
BrTextEditorHistoryMemento >> saveStateOf: aTextEditor [
	history := aTextEditor history
]
