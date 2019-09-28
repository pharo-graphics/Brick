"
I am sent when a new tab is added to ${class:BrTabGroupModel}
"
Class {
	#name : #BrTabAddedEvent,
	#superclass : #BrTabEvent,
	#instVars : [
		'position'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #accessing }
BrTabAddedEvent >> position [
	^ position
]

{ #category : #accessing }
BrTabAddedEvent >> position: anObject [
	position := anObject
]
