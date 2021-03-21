Class {
	#name : #BrTextEditorCursorIconHandler,
	#superclass : #BlCustomEventHandler,
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

{ #category : #'api - event managing' }
BrTextEditorCursorIconHandler >> dragEnterEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor default
]

{ #category : #'api - event managing' }
BrTextEditorCursorIconHandler >> dragLeaveEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor default
]

{ #category : #'api - accessing' }
BrTextEditorCursorIconHandler >> eventsToHandle [
	^ {
		BlDragEnterEvent.
		BlDragLeaveEvent.
		BlMouseEnterEvent.
		BlMouseLeaveEvent.
		BlMouseOverEvent 
	}
]

{ #category : #'api - event managing' }
BrTextEditorCursorIconHandler >> mouseEnterEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor overEditableText
]

{ #category : #'api - event managing' }
BrTextEditorCursorIconHandler >> mouseLeaveEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor default
]

{ #category : #'api - event managing' }
BrTextEditorCursorIconHandler >> mouseOverEvent: anEvent [
	anEvent currentTarget mouseCursor: BlCursor overEditableText
]
