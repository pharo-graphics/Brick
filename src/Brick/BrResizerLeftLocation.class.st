Class {
	#name : #BrResizerLeftLocation,
	#superclass : #BrResizerLocation,
	#category : #'Brick-Resizer - State'
}

{ #category : #'instance creation' }
BrResizerLeftLocation >> newResizerListener [
	^ BlResizerLeftListener new
]
