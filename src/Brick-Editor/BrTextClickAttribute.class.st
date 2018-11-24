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
BrTextClickAttribute >> handleEvent: anEvent in: aTextEditor [
	self performAction: anEvent in: aTextEditor
]

{ #category : #initialization }
BrTextClickAttribute >> initialize [
	super initialize.
	
	action := [ :aText :aTextElement :aTextEditor :anEvent | ]
]

{ #category : #private }
BrTextClickAttribute >> performAction: anEvent in: aTextEditor [
	self action glamourValueWithArgs: {
		anEvent currentTarget text. "first we pass text"
		anEvent currentTarget. "then the text piece (word) element"
		aTextEditor. "then the whole text editor"
		anEvent "the event itself"
	}
]

{ #category : #events }
BrTextClickAttribute >> wantsEvent: anEvent in: aTextEditor [
	^ anEvent isKindOf: BlClickEvent
]
