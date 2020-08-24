Class {
	#name : #BrTreeDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rootNode',
		'treeElement',
		'selection',
		'nodeTypeStencil',
		'clickToSelectHandler'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #private }
BrTreeDataSource >> assignRowIndex: aPosition to: anElementHolder [
	anElementHolder itemElement
		userData at: #treeRowIndex put: aPosition
]

{ #category : #private }
BrTreeDataSource >> getRowIndex: anElementHolder [
	^ anElementHolder itemElement userData
		at: #treeRowIndex
		ifAbsent: [ 0 ]
]

{ #category : #initialization }
BrTreeDataSource >> initialize [
	super initialize.

	selection := BlCompositeSelection new.
	clickToSelectHandler := BrTreeClickToSelectHandler new
]

{ #category : #accessing }
BrTreeDataSource >> itemCount [
	"Return the total number of items in the data set"
	<return: #Number>

	^ rootNode size
]

{ #category : #accessing }
BrTreeDataSource >> itemTypeAt: anItemPosition [
	| anItemNode anItemType |
	
	anItemNode := rootNode at: anItemPosition.

	anItemType := nodeTypeStencil
		itemPosition: anItemPosition;
		itemNode: anItemNode;
		build.

	nodeTypeStencil reset.

	^ anItemType
]

{ #category : #'accessing - stencils' }
BrTreeDataSource >> nodeTypeStencil: aBrTreeNodeTypeStencilBuilder [
	nodeTypeStencil := aBrTreeNodeTypeStencilBuilder asStencilBuilder: BrTreeNodeTypeStencilBuilder.
	self notifyChanged
]

{ #category : #hooks }
BrTreeDataSource >> onCollapsed: anAnnouncement [
	"self notifyItemsRemoved: (anAnnouncement from to: anAnnouncement to)."
	self notifyChanged
]

{ #category : #hooks }
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
BrTreeDataSource >> selection [
	<return: #BlSelection>
	
	^ selection
]

{ #category : #accessing }
BrTreeDataSource >> selection: aBlSelection [
	selection do: [ :eachMonotoneSelection | self notifyItemsChanged: eachMonotoneSelection indices ].
	selection := aBlSelection.
	selection do: [ :eachMonotoneSelection | self notifyItemsChanged: eachMonotoneSelection indices ]
]

{ #category : #accessing }
BrTreeDataSource >> treeElement [
	^ treeElement
]

{ #category : #accessing }
BrTreeDataSource >> treeElement: anObject [
	treeElement := anObject.
	clickToSelectHandler treeWidget: treeElement
]
