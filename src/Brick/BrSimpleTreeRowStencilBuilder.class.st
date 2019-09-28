Class {
	#name : #BrSimpleTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding',
		'text'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrSimpleTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	| aContainer aText |

	aContainer := (BrColumnedTreeRowStencilBuilder new
		treeNode: self treeNode;
		rowIndex: self rowIndex;
		treeElement: self treeElement;
		padding: self padding;
		cellSpacing: self cellSpacing) asElement.

	aText := text glamourValue: self treeNode value.
	aContainer addChild: (BrColumnCellLabelStencil new text: aText) asElement in: #expander.

	^ aContainer
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> cellSpacing [
	^ cellSpacing
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> cellSpacing: aNumber [
	cellSpacing := aNumber
]

{ #category : #initialization }
BrSimpleTreeRowStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty.
	text := [ :aNodeValue | aNodeValue gtDisplayString asRopedText ]
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> padding: aBlInsets [
	padding := aBlInsets
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> text [
	^ text
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> text: aTextOrBlock [
	text := aTextOrBlock
]
