Class {
	#name : #BrTextEditorNavigatorMoveDownOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveDownOperation >> performOn: aNavigator [
	| aGlobalTextIndex |
	
	aGlobalTextIndex := aNavigator
		findTextIndexBelowCursor: self cursor
		ifAbsent: [ ^ self ].

	aNavigator
		privateRegisterForMove: self cursor
		by: (aGlobalTextIndex - self cursor position)
]
