Class {
	#name : #BrColumnedListNameCellStencilBuilder,
	#superclass : #BrColumnedListCellStencilBuilder,
	#category : 'Brick-List - Support'
}

{ #category : #'api - instantiation' }
BrColumnedListNameCellStencilBuilder >> buildDefault [
	
	^ BrListLabelStencil new
		text: self rowValue name asRopedText
]
