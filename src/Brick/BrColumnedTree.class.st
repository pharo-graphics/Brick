Class {
	#name : #BrColumnedTree,
	#superclass : #BrTree,
	#instVars : [
		'columnedModel'
	],
	#category : #'Brick-Tree - UI'
}

{ #category : #'api - scripting' }
BrColumnedTree >> column [
	<return: #BrColumn>

	^ columnedModel column
]

{ #category : #initialization }
BrColumnedTree >> defaultListModel [
	^ BrColumnedTreeModel new
]

{ #category : #initialization }
BrColumnedTree >> initialize [
	super initialize.

	self viewModel add: (columnedModel := BrColumnedModel new).

	self look: BrColumnedTreeLook new
]

{ #category : #'api - scripting' }
BrColumnedTree >> nodeType: aBrTreeNodeTypeStencilBuilderOrBlock [
	"An item type stencil can be a #value-able of the form [ :anItemTypeFactory :aTreeNode :aNodeIndex | ].
	anItemTypeFactory is a ${class:BrListItemType class}$ "
	
	self viewModel nodeTypeStencil: aBrTreeNodeTypeStencilBuilderOrBlock
]
