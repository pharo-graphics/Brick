Class {
	#name : #BrLayoutResizerState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #accessing }
BrLayoutResizerState >> priority [
	^ UserPriority
]

{ #category : #testing }
BrLayoutResizerState >> shouldPropagateToChildren [
	^ true
]
