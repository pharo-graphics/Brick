"
I am sent by the text editor element when an element playing a role of the cursor is added to the editor
"
Class {
	#name : #BrTextEditorCursorElementAddedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'cursorElement'
	],
	#category : 'Brick-Editor-UI-Events'
}

{ #category : #accessing }
BrTextEditorCursorElementAddedEvent >> cursorElement [
	^ cursorElement
]

{ #category : #accessing }
BrTextEditorCursorElementAddedEvent >> cursorElement: anObject [
	cursorElement := anObject
]
