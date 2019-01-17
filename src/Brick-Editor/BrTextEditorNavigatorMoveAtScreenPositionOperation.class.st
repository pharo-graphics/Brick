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
	| aGlobalTextIndex |
	
	aGlobalTextIndex := aNavigator
		findTextIndexAtScreenPosition: self screenPosition
		ifAbsent: [ ^ self ].

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
