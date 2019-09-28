Class {
	#name : #BrSimpleListDataSource,
	#superclass : #BrListDataSource,
	#category : 'Brick-List - Support'
}

{ #category : #'instance creation' }
BrSimpleListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrSimpleListItemHolder new
		listElement: self listElement;
		rowStencilBuilder: rowStencil
]
