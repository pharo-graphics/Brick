Class {
	#name : #BrTextEditorNavigatorMoveRightOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveRightOperation >> performOn: aNavigator [
	aNavigator privateRegisterForMove: self cursor by: 1
]
