"
I move a cursor to the end of the current word when in the middle of a word, or to the end of the next word, when at the end of the current word
"
Class {
	#name : #BrTextEditorNavigatorMoveToEndNextWordOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveToEndNextWordOperation >> performOn: aNavigator [
	| textIterator newPosition |
	"Moves cursor to the end of the next word"

	newPosition := self cursor position.
	textIterator := aNavigator text iterator: (newPosition max: 1) to: aNavigator text size.
	[ textIterator hasNext and: [ newPosition = self cursor first position ] ] whileTrue: [
		| skip |
		skip := textIterator peek isSeparator.
		textIterator nextWord.
		skip ifFalse: [ newPosition := textIterator position ] ].
	
	aNavigator
		privateRegisterForMove: self cursor
		by: (newPosition - self cursor position)
]
