Class {
	#name : #BrSimpleListDataSource,
	#superclass : #BrListDataSource,
	#instVars : [
		'itemDataBinder'
	],
	#category : #'Brick-List - Support'
}

{ #category : #'accessing - stencils' }
BrSimpleListDataSource >> itemDataBinder: aBrListItemDataBinderBuilder [
	itemDataBinder := aBrListItemDataBinderBuilder.
	self notifyChanged
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
	
	anElementHolder
		itemElement: anItemElementWithBindedData;
		rowValue: anItemObject.

	self assignRowIndex: aPosition to: anElementHolder.

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
		asElement.

	anItemElement addEventHandler: clickToSelectHandler.

	^ BrSimpleListItemHolder new
		itemElement: anItemElement
]
