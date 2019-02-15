Class {
	#name : #BrTreeDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rootNode'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrTreeDataSource >> itemCount [
	"Return the total number of items in the data set"
	<return: #Number>

	^ rootNode size
]

{ #category : #accessing }
BrTreeDataSource >> rootValue: anObject computaton: aBlock [
	rootNode := BrTreeNode on: anObject computed: aBlock.
	self notifyChanged
]
