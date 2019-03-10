Class {
	#name : #BrSimpleTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrSimpleTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	| aContainer |

	aContainer := (BrColumnedTreeRowStencilBuilder new
		treeNode: self treeNode;
		rowIndex: self rowIndex;
		treeElement: self treeElement) asElement.

	aContainer addChild: (BlTextElement new text: self treeNode value gtDisplayString asRopedText) in: #expander.
	^ aContainer
]
