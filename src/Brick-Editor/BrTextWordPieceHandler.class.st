Class {
	#name : #BrTextWordPieceHandler,
	#superclass : #BlBasicEventHandler,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Word'
}

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
