Class {
	#name : #BrTextClickAttribute,
	#superclass : #BrTextEventHandlerAttribute,
	#instVars : [
		'action'
	],
	#category : #'Brick-Editor-Text-Attributes'
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
BrTextClickAttribute >> handleEvent: anEvent in: anEditorElement [
	self performAction: anEvent in: anEditorElement
]

{ #category : #initialization }
BrTextClickAttribute >> initialize [
	super initialize.
	
	action := [ :aText :aTextElement :anEditorElement :anEvent | ]
]

{ #category : #private }
BrTextClickAttribute >> performAction: anEvent in: anEditorElement [
	self action glamourValueWithArgs: {
		anEvent currentTarget text. "first we pass text"
		anEvent currentTarget. "then the text piece (word) element"
		anEditorElement. "then the whole editor element"
		anEvent "the event itself"
	}
]

{ #category : #events }
BrTextClickAttribute >> wantsEvent: anEvent in: anEditorElement [
	^ anEvent isKindOf: BlClickEvent
]
