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
		when: BrTreeRowElementStencilChangedEvent
		do: [ :anEvent | self onRowElementStencilChanged: anEvent rowElementStencil ].
		
	self
		when: BrTreeRowDataBinderChangedEvent
		do: [ :anEvent | self onRowDataBinderChanged: anEvent rowDataBinder ].
	
	self
		when: BrTreeNodeElementStencilChangedEvent
		do: [ :anEvent | self onNodeElementStencilChanged: anEvent nodeElementStencil ].

	self
		when: BrTreeNodeDataBinderChangedEvent
		do: [ :anEvent | self onNodeDataBinderChanged: anEvent nodeDataBinder ].

	self
		when: BrTreeNodeUnbinderChangedEvent
		do: [ :anEvent | self onNodeUnbinderChanged: anEvent nodeUnbinder ]

]

{ #category : #initialization }
BrSimpleTreeLook >> initializeRequests [
	super initializeRequests.

	self request: BrTreeRowElementStencilRequest new.
	self request: BrTreeNodeElementStencilRequest new.
	self request: BrTreeNodeDataBinderRequest new.
	self request: BrTreeRowDataBinderRequest new
]

{ #category : #hooks }
BrSimpleTreeLook >> onNodeDataBinderChanged: aBrTreeNodeDataBinder [
	treeElement dataSource nodeDataBinder: aBrTreeNodeDataBinder
]

{ #category : #hooks }
BrSimpleTreeLook >> onNodeElementStencilChanged: aBrTreeNodeElementStencilBuilder [
	treeElement dataSource nodeElementStencil: aBrTreeNodeElementStencilBuilder
]

{ #category : #hooks }
BrSimpleTreeLook >> onNodeUnbinderChanged: aBrTreeNodeUnbinder [
	treeElement dataSource nodeUnbinder: aBrTreeNodeUnbinder
]

{ #category : #hooks }
BrSimpleTreeLook >> onRowDataBinderChanged: aBrTreeRowDataBinder [
	treeElement dataSource rowDataBinder: aBrTreeRowDataBinder
]

{ #category : #hooks }
BrSimpleTreeLook >> onRowElementStencilChanged: aBrTreeRowElementStencilBuilder [
	treeElement dataSource rowElementStencil: aBrTreeRowElementStencilBuilder
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
