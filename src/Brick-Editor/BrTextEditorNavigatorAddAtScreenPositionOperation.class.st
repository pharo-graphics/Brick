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
	| aGlobalTextIndex |
	
	aGlobalTextIndex := aNavigator
		findTextIndexAtScreenPosition: self screenPosition
		ifAbsent: [ ^ self ].
	
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
