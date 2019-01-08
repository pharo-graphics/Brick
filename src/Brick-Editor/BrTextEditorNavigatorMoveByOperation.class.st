Class {
	#name : #BrTextEditorNavigatorMoveByOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#instVars : [
		'delta'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #accessing }
BrTextEditorNavigatorMoveByOperation >> delta [
	^ delta
]

{ #category : #accessing }
BrTextEditorNavigatorMoveByOperation >> delta: anObject [
	delta := anObject
]

{ #category : #matching }
BrTextEditorNavigatorMoveByOperation >> performOn: aNavigator [
	aNavigator privateRegisterForMove: self cursor by: self delta
]
