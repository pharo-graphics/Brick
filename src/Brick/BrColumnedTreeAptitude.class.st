Class {
	#name : #BrColumnedTreeAptitude,
	#superclass : #BrTreeAptitude,
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrColumnedTreeAptitude >> initialize [
	super initialize.

	treeElement dataSource: BrColumnedTreeDataSource new.
	treeElement dataSource
		rowElementStencil: BrColumnedTreeRowElementStencilBuilder new;
		rowDataBinder: BrDefaultTreeRowDataBinder new
]

{ #category : #initialization }
BrColumnedTreeAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrColumnsChanged do: [ :anEvent | self onColumnsChanged: anEvent columns ].
]

{ #category : #initialization }
BrColumnedTreeAptitude >> initializeRequests [
	super initializeRequests.

	self request: BrColumnsRequest new.
]

{ #category : #hooks }
BrColumnedTreeAptitude >> onColumnsChanged: aCollectionOfBrListColumns [
	treeElement dataSource columns: aCollectionOfBrListColumns
]

{ #category : #'accessing - stencils' }
BrColumnedTreeAptitude >> rowStencilBuilder: aStencil [
	"aStencil is expected to be a subclass of BrColumnedTreeRowElementStencilBuilder or a valuable"

	treeElement dataSource rowElementStencil: aStencil
]
