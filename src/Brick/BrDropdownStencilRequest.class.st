Class {
	#name : #BrDropdownStencilRequest,
	#superclass : #BrAnchoredStencilRequest,
	#category : #'Brick-Dropdown - Events'
}

{ #category : #initialization }
BrDropdownStencilRequest >> responseClass [
	^ BrDropdownStencilChanged
]
