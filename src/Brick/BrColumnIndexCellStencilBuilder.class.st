Class {
	#name : #BrColumnIndexCellStencilBuilder,
	#superclass : #BrColumnCellStencilBuilder,
	#category : #'Brick-Column - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnIndexCellStencilBuilder >> buildDefault [
	
	^ BrColumnCellLabelStencil new text: self rowIndex asRopedText
]
