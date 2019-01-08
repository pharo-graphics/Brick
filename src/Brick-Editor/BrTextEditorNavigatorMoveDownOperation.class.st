Class {
	#name : #BrTextEditorNavigatorMoveDownOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveDownOperation >> performOn: aNavigator [
	aNavigator editor enqueueCommand: (BrTextEditorCursorMoveCommand down cursor: self cursor)
]
