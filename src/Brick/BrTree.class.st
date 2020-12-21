Class {
	#name : #BrTree,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrSelectable + TBrScrollable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrSelectable classTrait + TBrScrollable classTrait',
	#category : #'Brick-Tree - UI'
}

{ #category : #'api - tree' }
BrTree >> collapseAll [
	self viewModel collapseAll
]

{ #category : #'api - tree' }
BrTree >> collapseAt: aLevelIndex [
	self viewModel collapseAt: aLevelIndex
]

{ #category : #initialization }
BrTree >> defaultListModel [
	^ BrAbstractTreeModel new
]

{ #category : #'api - tree' }
BrTree >> expandAll [
	"Expand all items in the receiver.
	Only items that currently have children will be expanded.  Others will remain collapsed, even if they have children added at a later time"

	self viewModel expandAll
]

{ #category : #'api - tree' }
BrTree >> expandSuchThat: anOneArgBlock [
	"It stops expanding children if a parent node does not satisfy the condition."
	self viewModel expandSuchThat: anOneArgBlock
]

{ #category : #'api - tree' }
BrTree >> expandUpTo: aLevelIndex [
	self viewModel expandUpTo: aLevelIndex
]

{ #category : #initialization }
BrTree >> initialize [
	super initialize.

	self viewModel: (self defaultListModel
		add: (selectionModel := BrSelectionModel new)).

	self initializeEventHandlers
]

{ #category : #initialization }
BrTree >> initializeEventHandlers [
	"shortcuts only work when tree has focus.
	click handler must not be added as a filter"
	self
		when: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		addShortcut: (BlShortcutWithAction new
			combination: (BlKeyCombination arrowDown);
			action: [ self selectNext ] );
		addShortcut: (BlShortcutWithAction new
			combination: (BlKeyCombination arrowUp);
			action: [ self selectPrevious ] );
		addShortcut: (BlShortcutWithAction new
			combination: (BlKeyCombination arrowLeft);
			action: [ self selectedNodeDo: #collapse ] );
		addShortcut: (BlShortcutWithAction new
			combination: (BlKeyCombination arrowRight);
			action: [ self selectedNodeDo: #expand ] )
]

{ #category : #accessing }
BrTree >> items: aCollectionOfItems children: aBlockOrValuable [
	self
		deprecated: 'Use #items:lazy: instead'
		transformWith: '`@receiver items: `@statements1 children: `@statements2' -> '`@receiver items: `@statements1 lazy: `@statements2'.

	self viewModel items: aCollectionOfItems children: aBlockOrValuable
]

{ #category : #'api - tree' }
BrTree >> items: aCollectionOfItems immediate: aBlockOrValuable [
	"Set the root items and an immediate computation block applied on each child recursively
	at the moment of assigning items, as opposed to the lazy version #items:children:"

	self viewModel items: aCollectionOfItems immediate: aBlockOrValuable
]

{ #category : #'api - tree' }
BrTree >> items: aCollectionOfItems lazy: aBlockOrValuable [
	"Set the root items and a lazy computation block that will be applied on each child recursively
	when a corresponding node is expanded, as opposed to an immediate version #items:immediate:"

	self viewModel items: aCollectionOfItems children: aBlockOrValuable
]

{ #category : #'api - selection' }
BrTree >> maxSelectionIndex [
	<return: #Number>

	^ self viewModel root size
]

{ #category : #'api - tree' }
BrTree >> nodeAt: aTreeIndex [
	<return: #BrTreeNode>

	^ self viewModel itemAt: aTreeIndex
]

{ #category : #scripting }
BrTree >> scrollTo: anIndex [
	self
		deprecated: 'Use scrollToIndex: instead'
		transformWith: '`@receiver scrollTo: `@arg' -> '`@receiver scrollToIndex: `@arg'.
		
	self scrollToIndex: anIndex
]

{ #category : #'api - selection' }
BrTree >> selectAndScrollTo: anObject [
	self viewModel root
		allChildrenNodesBreadthFirstDo: [ :treeNode | 
			treeNode ensureChildrenNodes.
			anObject = treeNode value
				ifTrue: [
					treeNode withAllParentNodesDo: [ :node | node expand ].
					(self isSelectedAt: treeNode indexInTree)
						ifFalse: [ self selectOne: treeNode indexInTree ].
					self scrollToIndex: treeNode indexInTree ] ]
]

{ #category : #'api - selection' }
BrTree >> selectedNodeDo: aBlock [
	"Evaluate aBlock with the currently selected node"
	
	self selectedIndices
		ifNotEmpty: [ :theIndices |
			(theIndices first between: 1 and: self viewModel itemCount)
				ifTrue: [ aBlock value: (self viewModel itemAt: theIndices first) ] ]
]
