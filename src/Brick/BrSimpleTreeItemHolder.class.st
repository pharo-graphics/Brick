Class {
	#name : #BrSimpleTreeItemHolder,
	#superclass : #BrTreeItemHolder,
	#category : #'Brick-Tree - Support'
}

{ #category : #'api - binding' }
BrSimpleTreeItemHolder >> rowValue: aTreeNode at: aRowIndex [
	| aStencil |

	rowValue := aTreeNode.

	aStencil := self rowStencilBuilder
		treeNode: aTreeNode;
		rowIndex: aRowIndex;
		build.

	itemElement := aStencil asElement
]
