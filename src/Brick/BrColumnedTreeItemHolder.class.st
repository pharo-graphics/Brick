Class {
	#name : #BrColumnedTreeItemHolder,
	#superclass : #BrTreeItemHolder,
	#instVars : [
		'columns'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrColumnedTreeItemHolder >> columns [
	^ columns
]

{ #category : #accessing }
BrColumnedTreeItemHolder >> columns: aCollectionOfBrListColumn [
	columns := aCollectionOfBrListColumn
]

{ #category : #accessing }
BrColumnedTreeItemHolder >> initialize [
	super initialize.
	
	columns := #()
]

{ #category : #'api - binding' }
BrColumnedTreeItemHolder >> rowValue: aTreeNode at: aRowIndex [
	| aRowStencil theCellElements |

	rowValue := aTreeNode.

	aRowStencil := self rowStencilBuilder
		treeElement: treeElement;
		treeNode: aTreeNode;
		rowIndex: aRowIndex;
		build.

	itemElement := aRowStencil asElement.

	theCellElements := self columns withIndexCollect: [ :aColumn :aColumnIndex |	
		(aColumn stencil
			rowValue: rowValue;
			rowIndex: aRowIndex;
			columnIndex: aColumnIndex;
			build) asElement ].
	
	itemElement addChildren: theCellElements
]
