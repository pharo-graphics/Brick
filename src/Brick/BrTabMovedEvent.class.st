"
I am sent when an existing tab is moved to another position in ${class:BrTabGroupModel}
"
Class {
	#name : #BrTabMovedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'oldPosition',
		'newPosition'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #accessing }
BrTabMovedEvent >> newPosition [
	^ newPosition
]

{ #category : #accessing }
BrTabMovedEvent >> newPosition: anObject [
	newPosition := anObject
]

{ #category : #accessing }
BrTabMovedEvent >> oldPosition [
	^ oldPosition
]

{ #category : #accessing }
BrTabMovedEvent >> oldPosition: anObject [
	oldPosition := anObject
]
