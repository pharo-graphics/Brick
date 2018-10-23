Class {
	#name : #BrTextWordPieceMouseDownHandler,
	#superclass : #BrTextWordPieceStatefulHandler,
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceMouseDownHandler >> eventClass [
	^ BlMouseDownEvent
]

{ #category : #'api - event managing' }
BrTextWordPieceMouseDownHandler >> handleEvent: anEvent [
	| aLocalTextIndex aGobaltextIndex aNavigator |
	
	aLocalTextIndex := anEvent currentTarget paragraph indexAtPosition: anEvent localPosition.
	aGobaltextIndex := (anEvent currentTarget text start + aLocalTextIndex - 1) max: 0.
	
	aNavigator := self editorElement editor navigator.
	anEvent modifiers isCmd
		ifTrue: [ aNavigator addAt: aGobaltextIndex ]
		ifFalse: [ aNavigator moveTo: aGobaltextIndex ].
	aNavigator apply
]
