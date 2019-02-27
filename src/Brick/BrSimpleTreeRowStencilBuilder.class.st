Class {
	#name : #BrSimpleTreeRowStencilBuilder,
	#superclass : #BrTreeRowStencilBuilder,
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrSimpleTreeRowStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	| aContainer aNode |
	
	aNode := self treeNode.

	aContainer := BlElement new.
	aContainer padding: (BlInsets left: aNode depth * 15).
	aContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].
	aContainer layout: BlLinearLayout horizontal alignCenterLeft.

	aContainer addChild: (
		BlElement new
			background: (aNode isEmpty ifTrue: [ Color transparent ] ifFalse: [ Color gray ]);
			margin: (BlInsets all: 5);
			when: BlClickEvent do: [ :anEvent | anEvent consumed: true. aNode toggle ];
			size: 12@12).

	aContainer addChild: (BlTextElement new text: aNode value gtDisplayString asRopedText).
	^ aContainer
]
