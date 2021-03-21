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
	
	aNavigator
		privateRegisterForMove: self cursor
		by: (aNavigator findWordEndAfter: self cursor position) - self cursor position
]
