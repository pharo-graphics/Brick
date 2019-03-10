Class {
	#name : #BrColumnNameCellStencilBuilder,
	#superclass : #BrColumnCellStencilBuilder,
	#category : #'Brick-Column - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnNameCellStencilBuilder >> buildDefault [
	
	^ BrColumnCellLabelStencil new text: self rowValue name asRopedText
]
