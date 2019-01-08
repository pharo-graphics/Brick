Class {
	#name : #BrTextEditorNavigatorRemoveCursorOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorRemoveCursorOperation >> performOn: aNavigator [
	aNavigator privateRegisterForRemove: self cursor
]
