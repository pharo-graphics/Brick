"
I move a cursor to the beginning of the current word when in the middle of a word, or to the beginning of the previous word, when at the beginning of the current word
"
Class {
	#name : #BrTextEditorNavigatorMoveToStartPreviousWordOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveToStartPreviousWordOperation >> performOn: aNavigator [
	| newPosition |
	"Moves cursor to the left by one character"

	newPosition := self cursor position - 1.
	newPosition := newPosition max: 0.
	[ newPosition > 0 and: [ (aNavigator text at: newPosition) isSeparator ] ] whileTrue:
		[ newPosition := newPosition - 1 ].
	[ newPosition = 0 or: [ (aNavigator text at: newPosition) isSeparator ] ] whileFalse:
		[ newPosition := newPosition - 1 ].
	
	aNavigator
		privateRegisterForMove: self cursor
		by: (newPosition - self cursor position)
]
