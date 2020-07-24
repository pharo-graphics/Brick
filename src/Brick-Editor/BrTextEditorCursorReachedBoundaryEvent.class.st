"
Is sent by the text editor when a cursor is at the boundary of the text editor (first or last line) and user requested it to move up
"
Class {
	#name : #BrTextEditorCursorReachedBoundaryEvent,
	#superclass : #BrTextEditorEvent,
	#instVars : [
		'cursor',
		'boundary'
	],
	#classVars : [
		'Bottom',
		'Top'
	],
	#category : #'Brick-Editor-Model - Events'
}

{ #category : #'class initialization' }
BrTextEditorCursorReachedBoundaryEvent class >> initialize [
	Top := #top.
	Bottom := #bottom
]

{ #category : #location }
BrTextEditorCursorReachedBoundaryEvent >> beBottom [
	boundary := Bottom
]

{ #category : #location }
BrTextEditorCursorReachedBoundaryEvent >> beTop [
	boundary := Top
]

{ #category : #accessing }
BrTextEditorCursorReachedBoundaryEvent >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorCursorReachedBoundaryEvent >> cursor: anObject [
	cursor := anObject
]

{ #category : #testing }
BrTextEditorCursorReachedBoundaryEvent >> isBottom [
	^ boundary = Bottom
]

{ #category : #testing }
BrTextEditorCursorReachedBoundaryEvent >> isTop [
	^ boundary = Top
]
