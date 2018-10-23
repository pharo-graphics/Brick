"
Is sent by the text editor after a cursor is moved from an ==oldIndex== to a ==newIndex== where both are text indices
"
Class {
	#name : #BrTextEditorCursorMovedEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'cursor',
		'oldIndex',
		'newIndex'
	],
	#category : #'Brick-Editor-UI - Events'
}

{ #category : #'instance creation' }
BrTextEditorCursorMovedEvent class >> cursor: aCursor from: anOldIndex to: aNewIndex [
	<return: #BrTextEditorCursorMovedEvent>

	^ self new
		cursor: aCursor;
		oldIndex: anOldIndex;
		newIndex: aNewIndex
]

{ #category : #accessing }
BrTextEditorCursorMovedEvent >> cursor [
	<return: #BrTextEditorSingleCursor>

	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorMovedEvent >> cursor: aBrTextEditorSingleCursor [
	cursor := aBrTextEditorSingleCursor
]

{ #category : #accessing }
BrTextEditorCursorMovedEvent >> newIndex [
	<return: #Number>

	^ newIndex
]

{ #category : #accessing }
BrTextEditorCursorMovedEvent >> newIndex: aNumber [
	newIndex := aNumber
]

{ #category : #accessing }
BrTextEditorCursorMovedEvent >> oldIndex [
	<return: #Number>

	^ oldIndex
]

{ #category : #accessing }
BrTextEditorCursorMovedEvent >> oldIndex: aNumber [
	oldIndex := aNumber
]
