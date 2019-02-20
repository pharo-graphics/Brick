Class {
	#name : #BrSimpleTreeDataSource,
	#superclass : #BrTreeDataSource,
	#category : #'Brick-Tree - Support'
}

{ #category : #'instance creation' }
BrSimpleTreeDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder rowValue: (rootNode at: aPosition) at: aPosition
]

{ #category : #'instance creation' }
BrSimpleTreeDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrSimpleTreeItemHolder new
		treeElement: self treeElement;
		rowStencilBuilder: rowStencil
]
