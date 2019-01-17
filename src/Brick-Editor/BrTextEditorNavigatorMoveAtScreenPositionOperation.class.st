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
	| aTransformation aGlobalTextIndex |
	
	aGlobalTextIndex := nil.

	aTransformation := BrTextEditorExplicitScreenToCursorTransformation new screenPosition: self screenPosition.
	aTransformation whenTransformed: [ :aTextIndex | aGlobalTextIndex := aTextIndex ].
	
	aNavigator editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation).
	
	"could not find a text index for a given screen position"
	aGlobalTextIndex
		ifNil: [ ^ self ].
		
	aNavigator
		privateRegisterForMove: self cursor
		by: (aGlobalTextIndex - self cursor position)
]

{ #category : #accessing }
BrTextEditorNavigatorMoveAtScreenPositionOperation >> screenPosition [
	^ screenPosition
]

{ #category : #accessing }
BrTextEditorNavigatorMoveAtScreenPositionOperation >> screenPosition: anObject [
	screenPosition := anObject
]
