Class {
	#name : #BrSimpleListDataSource,
	#superclass : #BrListDataSource,
	#instVars : [
		'itemDataBinder',
		'itemDataUnbinder'
	],
	#category : #'Brick-List - Support'
}

{ #category : #'accessing - stencils' }
BrSimpleListDataSource >> itemDataBinder: aBrListItemDataBinderBuilder [
	itemDataBinder := aBrListItemDataBinderBuilder.
	self notifyChanged
]

{ #category : #'accessing - stencils' }
BrSimpleListDataSource >> itemDataUnbinder: aBrListItemDataUnbinder [
	itemDataUnbinder := aBrListItemDataUnbinder.
	self notifyChanged
]

{ #category : #hooks }
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

{ #category : #hooks }
BrSimpleListDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	| anItemElement |
	
	anItemElement := itemElementStencil
		itemType: anItemType;
		asElement.

	anItemElement addEventHandler: clickToSelectHandler.

	^ BrSimpleListItemHolder new
		itemElement: anItemElement
]

{ #category : #hooks }
BrSimpleListDataSource >> onElementDetached: anElementHolder [	
	itemDataUnbinder
		itemElement: anElementHolder itemElement;
		itemObject:  anElementHolder rowValue;
		itemPosition: anElementHolder dataSourcePosition;
		build
]
