Class {
	#name : #BrDropdownHandleRequest,
	#superclass : #BrAnchoredHandleRequest,
	#category : #'Brick-Dropdown - Events'
}

{ #category : #initialization }
BrDropdownHandleRequest >> responseClass [
	^ BrDropdownHandleChanged
]
