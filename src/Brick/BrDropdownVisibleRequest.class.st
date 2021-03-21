Class {
	#name : #BrDropdownVisibleRequest,
	#superclass : #BrAnchoredVisibleRequest,
	#category : #'Brick-Dropdown - Events'
}

{ #category : #initialization }
BrDropdownVisibleRequest >> responseClass [
	^ BrDropdownVisibleChanged
]
