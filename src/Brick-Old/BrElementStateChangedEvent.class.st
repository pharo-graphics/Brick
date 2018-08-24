Class {
	#name : #BrElementStateChangedEvent,
	#superclass : #BlElementEvent,
	#category : 'Brick-Old'
}

{ #category : #sending }
BrElementStateChangedEvent >> sendTo: anObject [
	anObject elementStateChanged: self
]
