Class {
	#name : #BrTreeItemHolder,
	#superclass : #BlInfiniteHolder,
	#instVars : [
		'rowValue',
		'rowNode'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrTreeItemHolder >> itemElement: anElement [
	itemElement := anElement.
	itemElement compositingMode wantsCompositionLayer
		ifFalse: [ itemElement beInSeparateCompositionLayer ]
]

{ #category : #accessing }
BrTreeItemHolder >> rowNode [
	<return: #BrTreeNode>

	^ rowNode
]

{ #category : #accessing }
BrTreeItemHolder >> rowNode: aBrTreeNode [
	rowNode := aBrTreeNode
]
