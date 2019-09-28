Class {
	#name : #BrResizerLocationChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'location'
	],
	#category : #'Brick-Resizer - Events'
}

{ #category : #accessing }
BrResizerLocationChanged >> location [
	<return: #BrResizerLocation>

	^ location
]

{ #category : #accessing }
BrResizerLocationChanged >> location: aBrResizerLocation [
	location := aBrResizerLocation
]

{ #category : #accessing }
BrResizerLocationChanged >> state: anObject [
	"Override me to properly set the given state"

	self location: anObject
]
