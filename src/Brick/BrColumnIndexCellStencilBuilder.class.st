Class {
	#name : #BrColumnIndexCellStencilBuilder,
	#superclass : #BrColumnCellStencilBuilder,
	#category : #'Brick-Column - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnIndexCellStencilBuilder >> buildDefault [
	
	^ BrListLabelStencil new
		text: self rowIndex asRopedText
]
