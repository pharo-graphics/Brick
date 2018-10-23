"
I am sent by the text editor model when one of the cursors is removed
"
Class {
	#name : #BrTextEditorCursorRemovedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'cursor'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #'instance creation' }
BrTextEditorCursorRemovedEvent class >> cursor: aCursor [
	^ self new cursor: aCursor
]

{ #category : #accessing }
BrTextEditorCursorRemovedEvent >> cursor [
	<return: #BrTextEditorSingleCursor>

	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorRemovedEvent >> cursor: aBrTextEditorSingleCursor [
	cursor := aBrTextEditorSingleCursor
]
