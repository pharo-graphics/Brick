Class {
	#name : #BrTextEditorCursorsMemento,
	#superclass : #BrTextEditorMemento,
	#instVars : [
		'cursors'
	],
	#category : #'Brick-Editor-Model - Memento'
}

{ #category : #initialization }
BrTextEditorCursorsMemento >> initialize [
	super initialize.
	
	cursors := BrTextEditorMultipleCursor new
]

{ #category : #accessing }
BrTextEditorCursorsMemento >> order [
	^ 80
]

{ #category : #memento }
BrTextEditorCursorsMemento >> restoreStateOf: aTextEditor [
	| aNavigator |

	aNavigator := aTextEditor navigator removeAll.
	aNavigator withoutResettingDesiredCoordinate.
	cursors do: [ :eachCursor | aNavigator add: eachCursor ].
	aNavigator apply
]

{ #category : #memento }
BrTextEditorCursorsMemento >> saveStateOf: aTextEditor [
	cursors := aTextEditor cursors copy
]
