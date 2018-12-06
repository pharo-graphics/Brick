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

{ #category : #actions }
BrTextEditorMoveCursorRequest >> down [
	direction := #down
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> hasFocus [
	^ hasFocus
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> hasFocus: anObject [
	hasFocus := anObject
]

{ #category : #testing }
BrTextEditorMoveCursorRequest >> isDown [
	^ direction = #down
]

{ #category : #testing }
BrTextEditorMoveCursorRequest >> isUp [
	^ direction = #up
]

{ #category : #actions }
BrTextEditorMoveCursorRequest >> up [
	direction := #up
]
