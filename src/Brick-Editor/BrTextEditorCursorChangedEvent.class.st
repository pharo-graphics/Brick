Class {
	#name : #BrTextEditorCursorChangedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'cursors'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #accessing }
BrTextEditorCursorChangedEvent >> cursors [
	^ cursors
]

{ #category : #accessing }
BrTextEditorCursorChangedEvent >> cursors: anObject [
	cursors := anObject
]
