Class {
	#name : #BrResizerTopLocation,
	#superclass : #BrResizerLocation,
	#category : #'Brick-Resizer - State'
}

{ #category : #'instance creation' }
BrResizerTopLocation >> newResizerListener [
	^ BlResizerTopListener new
]
