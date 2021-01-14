"
I am a simple list that displays a large amount of items in a vertical orientation.


"
Class {
	#name : #BrSimpleList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #factory }
BrSimpleList class >> horizontal [
	^ self new beHorizontal
]

{ #category : #factory }
BrSimpleList class >> vertical [
	^ self new beVertical
]

{ #category : #'api - orientation' }
BrSimpleList >> beHorizontal [
	self states addState: BrListOrientationState horizontal
]

{ #category : #'api - orientation' }
BrSimpleList >> beVertical [
	self states addState: BrListOrientationState vertical
]

{ #category : #initialization }
BrSimpleList >> defaultListModel [
	^ BrSimpleListModel new
]

{ #category : #initialization }
BrSimpleList >> initialize [
	super initialize.
	self beVertical.
	self look: BrSimpleListLook + BrGlamorousListWithScrollbarLook.
]

{ #category : #'api - scripting' }
BrSimpleList >> itemDataBinder: aBrListItemDataBinderOrBlock [
	"An item type stencil can be a #value-able of the form [ :anItemElement :anItemObject :anItemIndex | ]"

	self viewModel itemDataBinder: aBrListItemDataBinderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleList >> itemDataUnbinder: aBrListItemUnbinderOrBlock [
	"An item type stencil can be a #value-able of the form [ :anItemElement :anItemObject :anItemIndex | ]"

	self viewModel itemDataUnbinder: aBrListItemUnbinderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleList >> itemId: aBrListItemIdStencilBuilderOrBlock [
	"An item type stencil can be a #value-able of the form [ :anItemObject :anItemIndex | ]"
	
	self viewModel itemIdStencil: aBrListItemIdStencilBuilderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleList >> itemStencil: aBrListItemElementStencilBuilderOrBlock [
	"An item element stencil can be a #value-able of the form [ :anItemType :aListWidget | ]"

	self viewModel itemElementStencil: aBrListItemElementStencilBuilderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleList >> itemType: aBrListItemTypeStencilBuilderOrBlock [
	"An item type stencil can be a #value-able of the form [ :anItemTypeFactory :anItemObject :anItemIndex | ].
	anItemTypeFactory is a ${class:BrListItemType class}$ "
	
	self viewModel itemTypeStencil: aBrListItemTypeStencilBuilderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleList >> stencil: aBrListRowStencilBuilder [
	"I am a part of the `toy` api. It is inefficient to use me because I always create a new
	element for each new row which may be expensive. It is much better to split it in two (or three)
	steps:
		- item element creation using #itemStencil: (the items are reused when they go out of the viewport)
		- data binding using #itemDataBinder: (to update just a part of the reused item element)
	A stencil builder can be a value-able of the form [ :aRowValue :anIndex :aListWidget | ]"
	| listRowStencil |

	self viewModel itemTypeStencil: (BrListItemTypeStencilBuilder new).

	listRowStencil := aBrListRowStencilBuilder asStencilBuilder: BrListRowStencilBuilder.
	self viewModel itemDataBinder: [ :anItemElement :anItemObject :anItemPosition |
		| aRowStencil |

		aRowStencil := listRowStencil
			listElement: self;
			rowValue: anItemObject;
			rowIndex: anItemPosition;
			build.
		
		listRowStencil reset.
		
		aRowStencil ]
]
