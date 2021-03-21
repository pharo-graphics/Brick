Class {
	#name : #BrTextEditorSelectionChangedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'selection'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorSelectionChangedEvent >> selection [
	^ selection
]

{ #category : #accessing }
BrTextEditorSelectionChangedEvent >> selection: anObject [
	selection := anObject
]
