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
	| aRowStencil theCellElements aRowContentElement |

	rowValue := aTreeNode.

	aRowStencil := self rowStencilBuilder
		treeElement: treeElement;
		treeNode: aTreeNode;
		rowIndex: aRowIndex;
		build.

	itemElement := aRowStencil asElement.

	theCellElements := self columns withIndexCollect: [ :aColumn :aColumnIndex |
		| aCellElement |
		aCellElement := (aColumn stencil
			rowValue: rowValue;
			rowIndex: aRowIndex;
			columnIndex: aColumnIndex;
			build) asElement.
		
		aColumn width applyOn: aCellElement.
		aCellElement ].
	
	aRowContentElement := itemElement
		childNamed: #expander
		ifFound: [ :anElement | anElement ]
		ifNone: [ itemElement ].

	self columns first width applyOn: aRowContentElement.
	aRowContentElement addChild: theCellElements first.

	itemElement addChildren: theCellElements allButFirst.
	itemElement beInSeparateCompositionLayer
]
