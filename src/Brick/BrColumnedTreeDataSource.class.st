Class {
	#name : #BrColumnedTreeDataSource,
	#superclass : #BrTreeDataSource,
	#instVars : [
		'columns'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrColumnedTreeDataSource >> columns [
	<return: #Collection of: #BrColumn>
	^ columns
]

{ #category : #accessing }
BrColumnedTreeDataSource >> columns: aCollectionOfBrListColumn [

	columns := aCollectionOfBrListColumn.
	self notifyChanged
]

{ #category : #initialization }
BrColumnedTreeDataSource >> initialize [
	super initialize.
	
	columns := #()
]

{ #category : #'instance creation' }
BrColumnedTreeDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrColumnedTreeItemHolder new
		treeElement: self treeElement;
		rowStencilBuilder: rowStencil;
		columns: columns
]
