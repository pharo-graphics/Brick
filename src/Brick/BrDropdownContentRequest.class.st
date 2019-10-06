Class {
	#name : #BrDropdownContentRequest,
	#superclass : #BrAnchoredContentRequest,
	#category : #'Brick-Dropdown - Events'
}

{ #category : #initialization }
BrDropdownContentRequest >> responseClass [
	^ BrDropdownContentChanged
]
