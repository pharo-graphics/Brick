Class {
	#name : #BrTreeDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'rootNode',
		'rowStencil',
		'treeElement',
		'selection'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #initialization }
BrTreeDataSource >> initialize [
	super initialize.

	selection := BlCompositeSelection new
]

{ #category : #accessing }
BrTreeDataSource >> itemCount [
	"Return the total number of items in the data set"
	<return: #Number>

	^ rootNode size
]

{ #category : #'instance creation' }
BrTreeDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder rowValue: (rootNode at: aPosition) at: aPosition.

	(self selection containsIndex: aPosition)
		ifTrue: [ anElementHolder itemElement dispatchEvent: (BrSelectedWish new selected: true) ]
		ifFalse: [ anElementHolder itemElement dispatchEvent: (BrSelectedWish new selected: false) ]
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
BrTreeDataSource >> rowStencilBuilder: aStencil [
	rowStencil := aStencil asStencilBuilder: BrTreeRowStencilBuilder.
	self notifyChanged
]

{ #category : #accessing }
BrTreeDataSource >> selection [
	<return: #BlSelection>
	
	^ selection
]

{ #category : #accessing }
BrTreeDataSource >> selection: aBlSelection [
	selection := aBlSelection.
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
