Class {
	#name : #BrTextEditorNavigatorMoveUpOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveUpOperation >> performOn: aNavigator [
	| aGlobalTextIndex |
	
	aGlobalTextIndex := aNavigator
		findTextIndexAboveCursor: self cursor
		ifAbsent: [ ^ self ].

	aNavigator
		privateRegisterForMove: self cursor
		by: (aGlobalTextIndex - self cursor position)
]
