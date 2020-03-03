Class {
	#name : #BrTextEditorCursorIconHandler,
	#superclass : #BlEventListener,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #accessing }
BrTextEditorCursorIconHandler class >> cleanUp [
	uniqueInstance := nil
]

{ #category : #accessing }
BrTextEditorCursorIconHandler class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #protocol }
BrTextEditorCursorIconHandler >> mouseOutEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor default
]

{ #category : #protocol }
BrTextEditorCursorIconHandler >> mouseOverEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor overEditableText
]
