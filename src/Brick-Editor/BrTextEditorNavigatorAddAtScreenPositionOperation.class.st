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
	| aTransformation aGlobalTextIndex |
	
	aGlobalTextIndex := nil.

	aTransformation := BrTextEditorExplicitScreenToCursorTransformation new screenPosition: self screenPosition.
	aTransformation whenTransformed: [ :aTextIndex | aGlobalTextIndex := aTextIndex ].
	
	aNavigator editor enqueueCommand: (BrTextEditorScreenToCursorCommand new transformation: aTransformation).
	
	"could not find a text index for a given screen position"
	aGlobalTextIndex
		ifNil: [ ^ self ].
	
	self cursor position: aGlobalTextIndex.
	aNavigator privateRegisterForAdd: self cursor
]

{ #category : #accessing }
BrTextEditorNavigatorAddAtScreenPositionOperation >> screenPosition [
	^ screenPosition
]

{ #category : #accessing }
BrTextEditorNavigatorAddAtScreenPositionOperation >> screenPosition: anObject [
	screenPosition := anObject
]
