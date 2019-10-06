Class {
	#name : #BrDropdownAnchorRequest,
	#superclass : #BrAnchoredAnchorRequest,
	#category : #'Brick-Dropdown - Events'
}

{ #category : #initialization }
BrDropdownAnchorRequest >> responseClass [
	^ BrDropdownAnchorChanged
]
