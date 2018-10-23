"
I am sent by the text editor model when a new cursor is added
"
Class {
	#name : #BrTextEditorCursorAddedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'cursor'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #'instance creation' }
BrTextEditorCursorAddedEvent class >> cursor: aCursor [
	^ self new cursor: aCursor
]

{ #category : #accessing }
BrTextEditorCursorAddedEvent >> cursor [
	<return: #BrTextEditorSingleCursor>

	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorAddedEvent >> cursor: aBrTextEditorSingleCursor [
	cursor := aBrTextEditorSingleCursor
]
