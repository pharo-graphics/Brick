Class {
	#name : #BrTextWordPieceUniqueHandler,
	#superclass : #BrTextWordPieceHandler,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Word'
}

{ #category : #accessing }
BrTextWordPieceUniqueHandler class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
BrTextWordPieceUniqueHandler class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]
