Class {
	#name : #BrTree,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrSelectable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrSelectable classTrait',
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

{ #category : #'api - tree' }
BrTree >> expandAll [
	self viewModel expandAll
]

{ #category : #'api - tree' }
BrTree >> expandUpTo: aLevelIndex [
	self viewModel expandUpTo: aLevelIndex
]

{ #category : #initialization }
BrTree >> initialize [
	super initialize.

	self viewModel: (BrTreeModel new
		add: (selectionModel := BrSelectionModel new);
		add: (BrInteractiveModel withAll: {
			BrLayoutHorizontalResizerModel matchParent.
			BrLayoutVerticalResizerModel matchParent })).

	self initializeEventHandlers
]

{ #category : #initialization }
BrTree >> initializeEventHandlers [
	"shortcuts only work when tree has focus.
	click handler must not be added as a filter"
	self
		when: BlClickEvent do: [ :anEvent | anEvent currentTarget requestFocus ];
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination arrowDown);
			action: [ self selectNext ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination arrowUp);
			action: [ self selectPrevious ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination arrowLeft);
			action: [ self selectedNodeDo: #collapse ] );
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination arrowRight);
			action: [ self selectedNodeDo: #expand ] )
]

{ #category : #accessing }
BrTree >> items: aCollectionOfItems children: aBlockOrValuable [
	"Set the root itemss and a computation block applied on each child recursively"

	self viewModel items: aCollectionOfItems children: aBlockOrValuable
]

{ #category : #'api - selection' }
BrTree >> maxSelectionIndex [
	<return: #Number>

	^ self viewModel root size
]

{ #category : #scripting }
BrTree >> selectAndScrollTo: anObject [
	self viewModel root
		allChildrenNodesBreadthFirstDo: [ :treeNode | 
			treeNode ensureChildNodesComputed.
			anObject = treeNode value
				ifTrue: [ treeNode withAllParentNodesDo: [ :node | node expand ].
					(self isSelectedAt: treeNode globalIndexInTree)
						ifFalse: [ self selectOne: treeNode globalIndexInTree ].
					(self childNamed: #tree)
						scrollToPosition: treeNode globalIndexInTree ] ]
]

{ #category : #'api - selection' }
BrTree >> selectedNodeDo: aBlock [
	"Evaluate aBlock with the currently selected node"

	self selection isEmpty
		ifTrue: [ ^ self ].
	
	(self selection from between: 1 and: self viewModel itemCount)
		ifFalse: [ ^ self ].
	
	aBlock value: (self viewModel itemAt: self selection from)
]
