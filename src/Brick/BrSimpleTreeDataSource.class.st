Class {
	#name : #BrSimpleTreeDataSource,
	#superclass : #BrTreeDataSource,
	#instVars : [
		'nodeElementStencil',
		'nodeDataBinder',
		'rowElementStencil',
		'rowDataBinder'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #'accessing - stencils' }
BrSimpleTreeDataSource >> nodeDataBinder: aBrTreeNodeDataBinder [
	"Set a data binder that should bind node data to the node element.
	Do not mistake it with the row data binder that adjusts the whole tree row
	according to the node data (for example takes depth into account)"

	nodeDataBinder := aBrTreeNodeDataBinder asStencilBuilder: BrTreeNodeDataBinder.
	self notifyChanged
]

{ #category : #'accessing - stencils' }
BrSimpleTreeDataSource >> nodeElementStencil: aBrTreeNodeElementStencilBuilder [
	"Set a stencil that should create an element for a given tree node. The resulting
	element will be embellished by the tree widget to contain extra adornment elements
	such as a button to expand the node"

	nodeElementStencil := aBrTreeNodeElementStencilBuilder asStencilBuilder: BrTreeNodeElementStencilBuilder.
	self notifyChanged
]

{ #category : #'instance creation' }
BrSimpleTreeDataSource >> onBindHolder: anElementHolder at: aPosition [
	| anItemNode |

	anItemNode := rootNode at: aPosition.

	"Bind node data to the node element"
	nodeDataBinder
		nodeElement: anElementHolder nodeElement;
		itemObject: anItemNode value;
		itemPosition: aPosition;
		build.

	"Bind node data to the row element"
	rowDataBinder
		rowElement: anElementHolder itemElement;
		itemNode: anItemNode;
		itemPosition: aPosition;
		build.

	anElementHolder rowNode: anItemNode.

	self assignRowIndex: aPosition to: anElementHolder.

	(self selection containsIndex: aPosition)
		ifTrue: [ anElementHolder itemElement dispatchEvent: (BrSelectedWish new selected: true) ]
		ifFalse: [ anElementHolder itemElement dispatchEvent: (BrSelectedWish new selected: false) ]
]

{ #category : #'instance creation' }
BrSimpleTreeDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	| aNodeElement aRowElement |

	"aNodeElement is the element that should represent the data of each tree node"
	aNodeElement := nodeElementStencil
		itemType: anItemType;
		asElement.

	"now wrap the node element in a row element with adornments"
	aRowElement := rowElementStencil
		itemType: anItemType;
		nodeElement: aNodeElement;
		asElement.

	aRowElement addEventHandler: clickToSelectHandler.

	^ BrSimpleTreeItemHolder new
		itemElement: aRowElement;
		nodeElement: aNodeElement
]

{ #category : #'accessing - stencils' }
BrSimpleTreeDataSource >> rowDataBinder: aBrTreeRowDataBinder [
	"Set a data binder that should bind node data to the whole tree row element"

	rowDataBinder := aBrTreeRowDataBinder asStencilBuilder: BrTreeRowDataBinder.
	self notifyChanged
]

{ #category : #'accessing - stencils' }
BrSimpleTreeDataSource >> rowElementStencil: aBrSimpleTreeRowElementStencilBuilder [
	"Row stencil wrapps the created node element into an element that will play a role
	of the row in the tree. Typically, a row also contains the expand button."

	rowElementStencil := aBrSimpleTreeRowElementStencilBuilder asStencilBuilder: BrSimpleTreeRowElementStencilBuilder.
	self notifyChanged
]
