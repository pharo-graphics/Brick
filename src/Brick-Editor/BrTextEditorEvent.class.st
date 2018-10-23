Class {
	#name : #BrTextEditorEvent,
	#superclass : #BlEvent,
	#instVars : [
		'editor'
	],
	#category : #'Brick-Editor-UI - Events'
}

{ #category : #accessing }
BrTextEditorEvent >> editor [
	^ editor
]

{ #category : #accessing }
BrTextEditorEvent >> editor: anObject [
	editor := anObject
]
