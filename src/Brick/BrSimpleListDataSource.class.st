Class {
	#name : #BrSimpleListDataSource,
	#superclass : #BrListDataSource,
	#category : 'Brick-List - Support'
}

{ #category : #'instance creation' }
BrSimpleListDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder rowValue: (self rowValues at: aPosition) at: aPosition.

	super onBindHolder: anElementHolder at: aPosition
]

{ #category : #'instance creation' }
BrSimpleListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrSimpleListItemHolder new
		listElement: self listElement;
		rowStencilBuilder: rowStencil
]
