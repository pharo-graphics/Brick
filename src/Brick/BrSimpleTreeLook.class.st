Class {
	#name : #BrSimpleTreeLook,
	#superclass : #BrLook,
	#instVars : [
		'treeElement',
		'itemStencilBuilder'
	],
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrSimpleTreeLook >> initialize [
	super initialize.
	
	treeElement := BrInfiniteTreeElement new.

	self itemStencilBuilder: BrSimpleTreeRowStencilBuilder new.
	self add: (BrLayoutResizerLook inherit inherit: treeElement)
]

{ #category : #initialization }
BrSimpleTreeLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenChanged do: [ :anEvent | self root: anEvent root ]
]

{ #category : #initialization }
BrSimpleTreeLook >> initializeLook [
	super initializeLook.
	
	treeElement dataSource treeElement: self widgetContent.

	self widgetContent
		layout: BlLinearLayout vertical;
		addChild: treeElement as: #tree
]

{ #category : #initialization }
BrSimpleTreeLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTreeChildrenRequest new
]

{ #category : #initialization }
BrSimpleTreeLook >> itemStencilBuilder: aStencilBuilder [
	"aStencilBuilder is expected to be a subclass of BrTreeRowStencilBuilder or a valuable"
	itemStencilBuilder := aStencilBuilder asStencilBuilder: BrTreeRowStencilBuilder.

	treeElement dataSource rowStencilBuilder: itemStencilBuilder
]

{ #category : #initialization }
BrSimpleTreeLook >> root: aTreeNode [
	treeElement dataSource rootNode: aTreeNode
]
