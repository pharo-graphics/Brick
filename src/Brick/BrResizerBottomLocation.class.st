Class {
	#name : #BrResizerBottomLocation,
	#superclass : #BrResizerLocation,
	#category : #'Brick-Resizer - State'
}

{ #category : #'instance creation' }
BrResizerBottomLocation >> newResizerListener [
	^ BlResizerBottomListener new minimumExtent: (0@30)
]
