Class {
	#name : #BrTextEditorNavigatorMoveToOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#instVars : [
		'position'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveToOperation >> performOn: aNavigator [
	aNavigator privateRegisterForMove: self cursor by: (self position - self cursor position)
]

{ #category : #accessing }
BrTextEditorNavigatorMoveToOperation >> position [
	^ position
]

{ #category : #accessing }
BrTextEditorNavigatorMoveToOperation >> position: anObject [
	position := anObject
]
