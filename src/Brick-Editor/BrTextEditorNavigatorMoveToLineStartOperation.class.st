Class {
	#name : #BrTextEditorNavigatorMoveToLineStartOperation,
	#superclass : #BrTextEditorNavigatorOperation,
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #matching }
BrTextEditorNavigatorMoveToLineStartOperation >> performOn: aNavigator [
	| aText aTextIterator foundLineBreak |
	
	aText := aNavigator text.
	aTextIterator := aText iterator: 1 to: self cursor position.
	aTextIterator skip: self cursor position.

	"if we have a line break before cursor - do nothing"
	(aTextIterator hasPrevious
		and: [ (aTextIterator previous; hasPrevious)
			and: [ aTextIterator peek isLineBreak ] ])
		ifTrue: [ ^ self ].

	foundLineBreak := false.
	[ aTextIterator hasPrevious and: [ (foundLineBreak := aTextIterator previous isLineBreak) not ] ] whileTrue.

	aNavigator
		privateRegisterForMove: self cursor
		by: (aTextIterator position - self cursor position + foundLineBreak asBit)
]
