Class {
	#name : #BrSimpleTreeDataSource,
	#superclass : #BrTreeDataSource,
	#category : #'Brick-Tree - Support'
}

{ #category : #'instance creation' }
BrSimpleTreeDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrSimpleTreeItemHolder new
		treeElement: self treeElement;
		rowStencilBuilder: rowStencil
]
