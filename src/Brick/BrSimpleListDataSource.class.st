Class {
	#name : #BrSimpleListDataSource,
	#superclass : #BrListDataSource,
	#category : #'Brick-List - Support'
}

{ #category : #accessing }
BrSimpleListDataSource >> itemTypeAt: anItemPosition [
	| anItemObject anItemType |
	
	anItemObject := self rowValues at: anItemPosition.

	anItemType := itemTypeStencil
		itemPosition: anItemPosition;
		itemObject: anItemObject;
		build.

	itemTypeStencil reset.

	^ anItemType
]

{ #category : #'instance creation' }
BrSimpleListDataSource >> onBindHolder: anElementHolder at: aPosition [
	| anItemElementWithBindedData anItemObject |

	anItemObject := self rowValues at: aPosition.

	anItemElementWithBindedData := itemDataBinder
		itemElement: anElementHolder itemElement;
		itemObject: anItemObject;
		itemPosition: aPosition;
		asElement.

	itemDataBinder reset.
	
	anElementHolder
		itemElement: anItemElementWithBindedData;
		rowValue: anItemObject.

	(self selection containsIndex: aPosition)
		ifTrue: [
			anElementHolder itemElement effect: (BlOverlayAboveEffect new paint: (Color gray alpha: 0.15)).
			anElementHolder itemElement dispatchEvent: (BrSelectedWish selected: true) ]
		ifFalse: [
			anElementHolder itemElement effect: BlNullEffect new.
			anElementHolder itemElement dispatchEvent: (BrSelectedWish selected: false) ]
]

{ #category : #'instance creation' }
BrSimpleListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	| anItemElement |
	
	anItemElement := itemElementStencil
		itemType: anItemType;
		listElement: self listElement;
		asElement.

	itemElementStencil reset.

	^ BrSimpleListItemHolder new
		itemElement: anItemElement
]
