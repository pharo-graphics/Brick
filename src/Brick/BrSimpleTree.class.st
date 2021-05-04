Class {
	#name : #BrSimpleTree,
	#superclass : #BrTree,
	#category : #'Brick-Tree - UI'
}

{ #category : #initialization }
BrSimpleTree >> defaultListModel [
	^ BrSimpleTreeModel new
]

{ #category : #initialization }
BrSimpleTree >> initialize [
	super initialize.

	self aptitude: BrSimpleTreeAptitude + BrGlamorousWithVerticalScrollbarAptitude
]

{ #category : #'api - scripting' }
BrSimpleTree >> nodeDataBinder: aBrTreeNodeDataBinderOrBlock [
	"An item type stencil can be a #value-able of the form [ :aNodeElement :anItemObject :aTreeNode :thePayloads | ]"

	self viewModel nodeDataBinder: aBrTreeNodeDataBinderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleTree >> nodeId: aBrTreeNodeIdStencilBuilderOrBlock [
	"A node id stencil can be a #value-able of the form [ :aTreeNode :aNodeIndex | ]"
	
	self viewModel nodeIdStencil: aBrTreeNodeIdStencilBuilderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleTree >> nodeStencil: aBrListItemElementStencilBuilderOrBlock [
	"A node element stencil can be a #value-able of the form [ :aNodeType | ]"

	self viewModel nodeElementStencil: aBrListItemElementStencilBuilderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleTree >> nodeType: aBrTreeNodeTypeStencilBuilderOrBlock [
	"An item type stencil can be a #value-able of the form [ :anItemTypeFactory :aTreeNode :aNodeIndex | ].
	anItemTypeFactory is a ${class:BrListItemType class}$ "
	
	self viewModel nodeTypeStencil: aBrTreeNodeTypeStencilBuilderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleTree >> nodeUnbinder: aBrTreeNodeUnbinder [
	"An item type stencil can be a #value-able of the form [ :aNodeElement :anItemObject :aTreeNode | ]"

	self viewModel nodeUnbinder: aBrTreeNodeUnbinder
]

{ #category : #'api - scripting' }
BrSimpleTree >> rowDataBinder: aBrTreeRowDataBinderOrBlock [
	"An item type stencil can be a #value-able of the form [ :aRowElement :aTreeNode :aRowPosition | ]"

	self viewModel rowDataBinder: aBrTreeRowDataBinderOrBlock
]

{ #category : #'api - scripting' }
BrSimpleTree >> rowStencil: aBrSimpleTreeRowElementStencilBuilderOrBlock [
	"A row element stencil can be a #value-able of the form [ :aNodeType :aNodeElement | ]"

	self viewModel rowElementStencil: aBrSimpleTreeRowElementStencilBuilderOrBlock
]

{ #category : #accessing }
BrSimpleTree >> stencil: aBlock [
	"I am a part of the `toy` api. It is inefficient to use me because I always create a new
	element for each new row which may be expensive. It is much better to split it in two (or three)
	steps:
		- item element creation using #nodeStencil: (the items are reused when they go out of the viewport)
		- data binding using #nodeDataBinder: (to update just a part of the reused item element)
	A stencil builder can be a value-able of the form [ :aRowValue :anIndex | ]"
	
	self nodeStencil: [ :aNodeType | 
		BlElement new
			labeled: 'Wrapper';
			layout: BlLinearLayout horizontal;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ] ].

	self nodeDataBinder: [ :aWrapperElement :anItemObject :aTreeNode :thePayload |
		| aNodeStencil |
		aNodeStencil := aBlock glamourValueWithArgs: { anItemObject. aTreeNode indexInTree }.
		aWrapperElement
			removeChildren;
			addChild: aNodeStencil asElement ]
]
