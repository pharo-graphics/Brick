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

	self look: BrSimpleTreeLook new
]

{ #category : #'api - scripting' }
BrSimpleTree >> nodeDataBinder: aBrTreeNodeDataBinderOrBlock [
	"An item type stencil can be a #value-able of the form [ :aNodeElement :aTreeNode :aNodeIndex | ]"

	self viewModel nodeDataBinder: aBrTreeNodeDataBinderOrBlock
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

{ #category : #accessing }
BrSimpleTree >> stencil: aTreeRowStencilBuilder [
	"A stencil builder can be a valuable of the form [ :aTreeNode :anIndex :aTreeWidget | ]"

	self look rowStencilBuilder: aTreeRowStencilBuilder
]
