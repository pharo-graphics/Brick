Class {
	#name : #BrTextEditorCursorsMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'cursors'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #accessing }
BrTextEditorCursorsMemento >> cursors: anObject [
	cursors := anObject
]

{ #category : #initialization }
BrTextEditorCursorsMemento >> initialize [
	super initialize.
	
	cursors := BrTextEditorMultipleCursor new
]

{ #category : #evaluating }
BrTextEditorCursorsMemento >> label [
	^ 'Cursors'
]

{ #category : #accessing }
BrTextEditorCursorsMemento >> order [
	^ 80
]

{ #category : #memento }
BrTextEditorCursorsMemento >> restoreStateOf: aTextEditor [
	aTextEditor navigator
		withoutResettingDesiredCoordinate;
		removeAll;
		addAll: cursors;
		apply
]

{ #category : #memento }
BrTextEditorCursorsMemento >> saveStateOf: aTextEditor [
	cursors := aTextEditor cursors copy
]

{ #category : #evaluating }
BrTextEditorCursorsMemento >> value [
	^ cursors
]
