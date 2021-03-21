Class {
	#name : #BrColumnedTreeLook,
	#superclass : #BrTreeLook,
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrColumnedTreeLook >> initialize [
	super initialize.

	treeElement dataSource: BrColumnedTreeDataSource new.
	treeElement dataSource
		rowElementStencil: BrColumnedTreeRowElementStencilBuilder new;
		rowDataBinder: BrDefaultTreeRowDataBinder new
]

{ #category : #initialization }
BrColumnedTreeLook >> initializeListeners [
	super initializeListeners.

	self when: BrColumnsChanged do: [ :anEvent | self onColumnsChanged: anEvent columns ].
]

{ #category : #initialization }
BrColumnedTreeLook >> initializeRequests [
	super initializeRequests.

	self request: BrColumnsRequest new.
]

{ #category : #hooks }
BrColumnedTreeLook >> onColumnsChanged: aCollectionOfBrListColumns [
	treeElement dataSource columns: aCollectionOfBrListColumns
]

{ #category : #'accessing - stencils' }
BrColumnedTreeLook >> rowStencilBuilder: aStencil [
	"aStencil is expected to be a subclass of BrColumnedTreeRowElementStencilBuilder or a valuable"

	treeElement dataSource rowElementStencil: aStencil
]
