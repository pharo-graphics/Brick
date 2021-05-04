Class {
	#name : #BrSimpleTreeAptitude,
	#superclass : #BrTreeAptitude,
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrSimpleTreeAptitude >> initialize [
	super initialize.

	treeElement dataSource: BrSimpleTreeDataSource new.
	treeElement dataSource
		rowElementStencil: BrSimpleTreeRowElementStencilBuilder new;
		rowDataBinder: BrDefaultTreeRowDataBinder new
]

{ #category : #initialization }
BrSimpleTreeAptitude >> initializeListeners [
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
BrSimpleTreeAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrTreeRowElementStencilRequest new.
	self request: BrTreeNodeElementStencilRequest new.
	self request: BrTreeNodeDataBinderRequest new.
	self request: BrTreeRowDataBinderRequest new
]

{ #category : #hooks }
BrSimpleTreeAptitude >> onNodeDataBinderChanged: aBrTreeNodeDataBinder [
	treeElement dataSource nodeDataBinder: aBrTreeNodeDataBinder
]

{ #category : #hooks }
BrSimpleTreeAptitude >> onNodeElementStencilChanged: aBrTreeNodeElementStencilBuilder [
	treeElement dataSource nodeElementStencil: aBrTreeNodeElementStencilBuilder
]

{ #category : #hooks }
BrSimpleTreeAptitude >> onNodeUnbinderChanged: aBrTreeNodeUnbinder [
	treeElement dataSource nodeUnbinder: aBrTreeNodeUnbinder
]

{ #category : #hooks }
BrSimpleTreeAptitude >> onRowDataBinderChanged: aBrTreeRowDataBinder [
	treeElement dataSource rowDataBinder: aBrTreeRowDataBinder
]

{ #category : #hooks }
BrSimpleTreeAptitude >> onRowElementStencilChanged: aBrTreeRowElementStencilBuilder [
	treeElement dataSource rowElementStencil: aBrTreeRowElementStencilBuilder
]

{ #category : #enumerating }
BrSimpleTreeAptitude >> whenAttachedDo: aBlock [
	treeElement dataSource attachedBlock: aBlock
]

{ #category : #enumerating }
BrSimpleTreeAptitude >> whenDetachedDo: aBlock [
	treeElement dataSource detachedBlock: aBlock
]

{ #category : #enumerating }
BrSimpleTreeAptitude >> whenRecycledDo: aBlock [
	treeElement dataSource recycledBlock: aBlock
]
