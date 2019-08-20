Class {
	#name : #BrTabActionbarRequest,
	#superclass : #BrTabRequest,
	#category : #'Brick-Tabs - Events'
}

{ #category : #initialization }
BrTabActionbarRequest >> responseClass [
	^ BrTabActionbarChangedEvent
]
