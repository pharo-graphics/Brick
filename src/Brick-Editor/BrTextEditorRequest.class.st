"
I am a hierarchy of text editor request.

A request is a special type of the event that is sent by the editor to each segment piece in order to request them to react to some actions such as cursor movement or selection.

""""Requests are dispatched by the editor to each segment piece""""
"
Class {
	#name : #BrTextEditorRequest,
	#superclass : #BlEvent,
	#instVars : [
		'editorElement'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorRequest >> editorElement [
	^ editorElement
]

{ #category : #accessing }
BrTextEditorRequest >> editorElement: anObject [
	editorElement := anObject
]
