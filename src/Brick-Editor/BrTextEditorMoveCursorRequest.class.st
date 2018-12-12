Class {
	#name : #BrTextEditorMoveCursorRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'cursor',
		'cursorPosition',
		'hasFocus',
		'direction'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorMoveCursorRequest >> cursor: anObject [
	cursor := anObject
]

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
