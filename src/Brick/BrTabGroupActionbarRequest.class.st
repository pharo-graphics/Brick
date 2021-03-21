Class {
	#name : #BrTabGroupActionbarRequest,
	#superclass : #BrTabGroupRequest,
	#category : #'Brick-Tabs - Events'
}

{ #category : #initialization }
BrTabGroupActionbarRequest >> responseClass [
	^ BrTabGroupActionbarChangedEvent
]
