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

	anElementHolder itemElement states removeState: BlElementState hovered.

	(self selection containsIndex: aPosition)
		ifTrue: [ anElementHolder itemElement states addState: BlElementSelectedState uniqueInstance ]
		ifFalse: [ anElementHolder itemElement states removeState: BlElementSelectedState uniqueInstance ]
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
]

{ #category : #hooks }
BrSimpleListDataSource >> onElementRecycled: anElementHolder [
	itemDataUnbinder
		itemElement: anElementHolder itemElement;
		itemObject:  anElementHolder rowValue;
		itemPosition: anElementHolder dataSourcePosition;
		build
]
