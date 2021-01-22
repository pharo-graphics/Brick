Class {
	#name : #BrTextClickAttribute,
	#superclass : #BrTextEventHandlerAttribute,
	#instVars : [
		'action'
	],
	#category : #'Brick-Editor-Attributes'
}

{ #category : #accessing }
BrTextClickAttribute >> action [
	^ action
]

{ #category : #accessing }
BrTextClickAttribute >> action: aValuable [
	self 
		assert: [ aValuable notNil ] 
		description: [ 'Action should be initialized' ].

	action := aValuable
]

{ #category : #events }
BrTextClickAttribute >> handleEvent: anEvent in: aTextEditor on: aTBrTextEditorTextualPiece [
	self performAction: anEvent in: aTextEditor on: aTBrTextEditorTextualPiece
]

{ #category : #initialization }
BrTextClickAttribute >> initialize [
	super initialize.
	
	action := [ :aTBrTextEditorTextualPiece :aTextElement :aTextEditor :anEvent | ]
]

{ #category : #private }
BrTextClickAttribute >> performAction: anEvent in: aTextEditor on: aTBrTextEditorTextualPiece [
	self action glamourValueWithArgs: {
		aTBrTextEditorTextualPiece. "first we pass text"
		anEvent currentTarget. "then the text piece (word) element"
		aTextEditor. "then the whole text editor"
		anEvent "the event itself"
	}
]

{ #category : #events }
BrTextClickAttribute >> wantsEvent: anEvent in: aTextEditor [
	^ anEvent isKindOf: BlClickEvent
]
