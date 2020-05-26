Class {
	#name : #BrColumnedTreeRowStencilBuilder,
	#superclass : #BrEmptyColumnedTreeRowStencilBuilder,
	#category : #'Brick-Tree - Stencil'
}

{ #category : #private }
BrColumnedTreeRowStencilBuilder >> createExpandCollapseElementFor: aNode [
	^ BrTriangle new
		look: BrGlamorousTriangleInCircleLook;
		action: [ aNode toggle ];
		hide: aNode isEmpty;
		disabled: aNode isEmpty.
]

{ #category : #private }
BrColumnedTreeRowStencilBuilder >> fillExpander: anExpander for: aNode [
	super fillExpander: anExpander for: aNode.
	anExpander addChild: (self createExpandCollapseElementFor: aNode) as: #triangle.
]
