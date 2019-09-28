Class {
	#name : #BrTabToolbarRequest,
	#superclass : #BrTabRequest,
	#category : #'Brick-Tabs - Events'
}

{ #category : #initialization }
BrTabToolbarRequest >> responseClass [
	^ BrTabToolbarChangedEvent
]
