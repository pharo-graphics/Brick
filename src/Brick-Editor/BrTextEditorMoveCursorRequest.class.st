Class {
	#name : #BrTextEditorMoveCursorRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'cursorPosition',
		'hasFocus',
		'direction'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> cursorPosition [
	^ cursorPosition
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> cursorPosition: anObject [
	cursorPosition := anObject
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> direction [
	^ direction
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> direction: anObject [
	direction := anObject
]

{ #category : #actions }
BrTextEditorMoveCursorRequest >> down [
	self direction: #down
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> hasFocus [
	^ hasFocus
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> hasFocus: anObject [
	hasFocus := anObject
]

{ #category : #actions }
BrTextEditorMoveCursorRequest >> up [
	self direction: #up
]
