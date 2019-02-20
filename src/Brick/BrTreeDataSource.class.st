Class {
	#name : #BrTreeDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rootNode',
		'rowStencil',
		'treeElement'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrTreeDataSource >> itemCount [
	"Return the total number of items in the data set"
	<return: #Number>

	^ rootNode size
]

{ #category : #'as yet unclassified' }
BrTreeDataSource >> onCollapsed: anAnnouncement [
	"self notifyItemsRemoved: (anAnnouncement from to: anAnnouncement to)."
	self notifyChanged
]

{ #category : #'as yet unclassified' }
BrTreeDataSource >> onExpanded: anAnnouncement [
	"self notifyItemsInserted: (anAnnouncement from to: anAnnouncement to)"
	self notifyChanged
]

{ #category : #accessing }
BrTreeDataSource >> rootNode: aTreeNode [
	rootNode := aTreeNode.
	rootNode announcer weak when: BrTreeNodeExpanded send: #onExpanded: to: self.
	rootNode announcer weak when: BrTreeNodeCollapsed send: #onCollapsed: to: self.
	
	self notifyChanged
]

{ #category : #accessing }
BrTreeDataSource >> rootValue: anObject computaton: aBlock [
	rootNode := BrTreeNode on: anObject computed: aBlock.
	self notifyChanged
]

{ #category : #accessing }
BrTreeDataSource >> rowStencilBuilder: aStencil [
	rowStencil := aStencil asStencilBuilder: BrTreeRowStencilBuilder.
	self notifyChanged
]

{ #category : #accessing }
BrTreeDataSource >> treeElement [
	^ treeElement
]

{ #category : #accessing }
BrTreeDataSource >> treeElement: anObject [
	treeElement := anObject
]
