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
	| aContainer |
	aContainer := (self defaultColumnedTreeRowStencilBuilder
		treeNode: self treeNode;
		rowIndex: self rowIndex;
		treeElement: self treeElement;
		padding: self padding;
		cellSpacing: self cellSpacing) asElement.
	self buildLabelIn: aContainer.
	^ aContainer
]

{ #category : #private }
BrSimpleTreeRowStencilBuilder >> buildLabel [
	<return: #BrLabel>
	^ (BrColumnCellLabelStencil new text: self buildText) asElement
]

{ #category : #private }
BrSimpleTreeRowStencilBuilder >> buildLabelIn: aContainer [
	aContainer
		addChild: self buildLabel
		in: #expander
]

{ #category : #private }
BrSimpleTreeRowStencilBuilder >> buildText [
	<return: #BlRopedText>
	^ (text glamourValue: self treeNode value) asRopedText
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
BrSimpleTreeRowStencilBuilder >> defaultColumnedTreeRowStencilBuilder [
	^ BrColumnedTreeRowStencilBuilder new
]

{ #category : #initialization }
BrSimpleTreeRowStencilBuilder >> defaultText [
	^ [ :aNodeValue | aNodeValue gtDisplayString asRopedText ]
]

{ #category : #initialization }
BrSimpleTreeRowStencilBuilder >> initialize [
	super initialize.
	cellSpacing := 0.
	padding := BlInsets empty.
	text := self defaultText
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
