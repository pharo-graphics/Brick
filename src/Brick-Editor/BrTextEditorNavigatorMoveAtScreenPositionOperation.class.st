Class {
	#name : #BrTextEditorNavigatorMoveAtScreenPositionOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#instVars : [
		'screenPosition'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveAtScreenPositionOperation >> performOn: aNavigator [
	| aTransformation |
	
	aTransformation := BrTextEditorExplicitScreenToCursorTransformation new screenPosition: self screenPosition.
	aTransformation whenTransformed: [ :aTextIndex | aTextIndex inspect ].
	
	aNavigator editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation)
]

{ #category : #accessing }
BrTextEditorNavigatorMoveAtScreenPositionOperation >> screenPosition [
	^ screenPosition
]

{ #category : #accessing }
BrTextEditorNavigatorMoveAtScreenPositionOperation >> screenPosition: anObject [
	screenPosition := anObject
]
