"
I am sent to the segment piece element when a cursor at a given text index in local text piece coordinates should be hidden
"
Class {
	#name : #BrTextEditorHideCursorRequest,
	#superclass : #BrTextEditorRequest,
	#instVars : [
		'cursorPosition'
	],
	#category : #'Brick-Editor-UI - Requests'
}

{ #category : #accessing }
BrTextEditorHideCursorRequest >> cursorPosition [
	<return: #Number>

	^ cursorPosition
]

{ #category : #accessing }
BrTextEditorHideCursorRequest >> cursorPosition: aNumber [
	
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Cursor position must not be negative' ].

	cursorPosition := aNumber
]
