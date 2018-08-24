"
I am sent by the text editor element when an element playing a role of the cursor is removed from the editor
"
Class {
	#name : #BrTextEditorCursorElementRemovedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'cursorElement'
	],
	#category : 'Brick-Editor-UI-Events'
}

{ #category : #accessing }
BrTextEditorCursorElementRemovedEvent >> cursorElement [
	^ cursorElement
]

{ #category : #accessing }
BrTextEditorCursorElementRemovedEvent >> cursorElement: anObject [
	cursorElement := anObject
]
