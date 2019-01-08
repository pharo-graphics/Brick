Class {
	#name : #BrTextEditorNavigatorMoveUpOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveUpOperation >> performOn: aNavigator [
	aNavigator editor enqueueCommand: (BrTextEditorCursorMoveCommand up cursor: self cursor)
]
