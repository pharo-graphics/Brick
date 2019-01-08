Class {
	#name : #BrTextEditorNavigatorAddCursorOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorAddCursorOperation >> performOn: aNavigator [
	aNavigator privateRegisterForAdd: self cursor
]
