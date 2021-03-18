Class {
	#name : #BrTextEditorNavigatorMoveToLineStartOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveToLineStartOperation >> performOn: aNavigator [
	| aDelta |	

	aDelta := (aNavigator findTextIndexAtLineStart: self cursor) - self cursor position.
	aDelta isZero
		ifTrue: [ ^ self ].

	aNavigator
		privateRegisterForMove: self cursor
		by: aDelta
]
