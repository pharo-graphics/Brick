Class {
	#name : #BrSimpleListRowStencilBuilder,
	#superclass : #BrListRowStencilBuilder,
	#category : 'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrSimpleListRowStencilBuilder >> buildDefault [
	^ BrColumnCellLabelStencil new text: self rowValue asString
]
