Class {
	#name : #BrSimpleTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding'
	],
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrSimpleTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	| aContainer |

	aContainer := (BrColumnedTreeRowStencilBuilder new
		treeNode: self treeNode;
		rowIndex: self rowIndex;
		treeElement: self treeElement;
		padding: self padding;
		cellSpacing: self cellSpacing) asElement.

	aContainer addChild: (BlTextElement new text: self treeNode value gtDisplayString asRopedText) in: #expander.
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
	padding := BlInsets empty
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrSimpleTreeRowStencilBuilder >> padding: aBlInsets [
	padding := aBlInsets
]
