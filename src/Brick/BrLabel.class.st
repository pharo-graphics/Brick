Class {
	#name : #BrLabel,
	#superclass : #BlElement,
	#category : #'Brick-Label - UI'
}

{ #category : #initialization }
BrLabel >> initialize [
	super initialize.

	self viewModel: (BrLabelModel new)
]
