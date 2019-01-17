Class {
	#name : #BrTextEditorNavigatorAddAtScreenPositionOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#instVars : [
		'screenPosition'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorAddAtScreenPositionOperation >> performOn: aNavigator [
	| aTransformation |

	aTransformation := BrTextEditorExplicitScreenToCursorTransformation new screenPosition: self screenPosition.
	aTransformation whenTransformed: [ :aTextIndex | aTextIndex inspect ].

	aNavigator editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation)
]

{ #category : #accessing }
BrTextEditorNavigatorAddAtScreenPositionOperation >> screenPosition [
	^ screenPosition
]

{ #category : #accessing }
BrTextEditorNavigatorAddAtScreenPositionOperation >> screenPosition: anObject [
	screenPosition := anObject
]
