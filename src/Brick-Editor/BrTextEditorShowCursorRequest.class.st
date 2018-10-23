"
I am sent to the segment piece element when a cursor at a given text index in local text piece coordinates should be shown
"
Class {
	#name : #BrTextEditorShowCursorRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'cursorPosition',
		'hasFocus'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorShowCursorRequest >> cursorPosition [
	<return: #Number>

	^ cursorPosition
]

{ #category : #accessing }
BrTextEditorShowCursorRequest >> cursorPosition: aNumber [
	
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Cursor position must not be negative' ].

	cursorPosition := aNumber
]

{ #category : #accessing }
BrTextEditorShowCursorRequest >> hasFocus [
	^ hasFocus
]

{ #category : #accessing }
BrTextEditorShowCursorRequest >> hasFocus: anObject [
	hasFocus := anObject
]
