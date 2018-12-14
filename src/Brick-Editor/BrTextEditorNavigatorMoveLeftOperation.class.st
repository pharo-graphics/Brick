Class {
	#name : #BrTextEditorNavigatorMoveLeftOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveLeftOperation >> performOn: aNavigator [
	aNavigator privateRegisterForMove: self cursor by: -1
]
