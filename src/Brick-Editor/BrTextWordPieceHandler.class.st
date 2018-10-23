Class {
	#name : #BrTextWordPieceHandler,
	#superclass : #BlBasicEventHandler,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceHandler class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
BrTextWordPieceHandler class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
BrTextWordPieceHandler >> eventClass [
	^ self subclassResponsibility
]

{ #category : #'api - event managing' }
BrTextWordPieceHandler >> handleEvent: anEvent [
	self subclassResponsibility
]

{ #category : #'api - event managing' }
BrTextWordPieceHandler >> wantsEvent: anEvent [
	^ anEvent class = self eventClass
]
