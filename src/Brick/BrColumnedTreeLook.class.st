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
