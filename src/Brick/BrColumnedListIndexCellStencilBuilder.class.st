Class {
	#name : #BrColumnedListIndexCellStencilBuilder,
	#superclass : #BrColumnedListCellStencilBuilder,
	#category : 'Brick-List - Support'
}

{ #category : #'api - instantiation' }
BrColumnedListIndexCellStencilBuilder >> buildDefault [
	
	^ BrListLabelStencil new
		text: self rowIndex asRopedText
]
