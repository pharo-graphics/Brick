Class {
	#name : #BrTextEditorRequest,
	#superclass : #BlEvent,
	#instVars : [
		'editorElement'
	],
	#category : 'Brick-Editor-UI-Requests'
}

{ #category : #accessing }
BrTextEditorRequest >> editorElement [
	^ editorElement
]

{ #category : #accessing }
BrTextEditorRequest >> editorElement: anObject [
	editorElement := anObject
]
