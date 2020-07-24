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
	self viewModel expandAll
]

{ #category : #'api - tree' }
BrTree >> expandUpTo: aLevelIndex [
	self viewModel expandUpTo: aLevelIndex
]

{ #category : #initialization }
BrTree >> initialize [
	super initialize.

	self viewModel: (self defaultListModel
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
BrTree >> scrollTo: anIndex [
	self
		deprecated: 'Use scrollToIndex: instead'
		transformWith: '`@receiver scrollTo: `@arg' -> '`@receiver scrollToIndex: `@arg'.
		
	self scrollToIndex: anIndex
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
					self scrollToIndex: treeNode globalIndexInTree ] ]
]

{ #category : #'api - selection' }
BrTree >> selectedNodeDo: aBlock [
	"Evaluate aBlock with the currently selected node"
	
	self selectedIndices
		ifNotEmpty: [ :theIndices |
			(theIndices first between: 1 and: self viewModel itemCount)
				ifTrue: [ aBlock value: (self viewModel itemAt: theIndices first) ] ]
]
