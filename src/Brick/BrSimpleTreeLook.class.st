Class {
	#name : #BrSimpleTreeLook,
	#superclass : #BrTreeLook,
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrSimpleTreeLook >> initialize [
	super initialize.

	treeElement dataSource: BrSimpleTreeDataSource new.
	treeElement dataSource
		rowElementStencil: BrSimpleTreeRowElementStencilBuilder new;
		rowDataBinder: BrDefaultTreeRowDataBinder new
]

{ #category : #initialization }
BrSimpleTreeLook >> initializeListeners [
	super initializeListeners.
	
	self
		when: BrTreeNodeElementStencilChangedEvent
		do: [ :anEvent | self onNodeElementStencilChanged: anEvent nodeElementStencil ].

	self
		when: BrTreeNodeDataBinderChangedEvent
		do: [ :anEvent | self onNodeDataBinderChanged: anEvent nodeDataBinder ]

]

{ #category : #initialization }
BrSimpleTreeLook >> initializeRequests [
	super initializeRequests.

	self request: BrTreeNodeElementStencilRequest new.
	self request: BrTreeNodeDataBinderRequest new
]

{ #category : #hooks }
BrSimpleTreeLook >> onNodeDataBinderChanged: aBrTreeNodeDataBinder [
	treeElement dataSource nodeDataBinder: aBrTreeNodeDataBinder
]

{ #category : #hooks }
BrSimpleTreeLook >> onNodeElementStencilChanged: aBrTreeNodeElementStencilBuilder [
	treeElement dataSource nodeElementStencil: aBrTreeNodeElementStencilBuilder
]

{ #category : #enumerating }
BrSimpleTreeLook >> whenAttachedDo: aBlock [
	treeElement dataSource attachedBlock: aBlock
]

{ #category : #enumerating }
BrSimpleTreeLook >> whenDetachedDo: aBlock [
	treeElement dataSource detachedBlock: aBlock
]

{ #category : #enumerating }
BrSimpleTreeLook >> whenRecycledDo: aBlock [
	treeElement dataSource recycledBlock: aBlock
]
