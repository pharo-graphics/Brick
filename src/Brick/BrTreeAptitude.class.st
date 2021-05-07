Class {
	#name : #BrTreeAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'treeElement'
	],
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrTreeAptitude >> initialize [
	super initialize.

	treeElement := BrInfiniteTreeElement new.
	self add: (BrLayoutResizerAptitude inherit inherit: treeElement).

	self addChangeAddChildAs: #(content scrollable) with: [ treeElement ].
	
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | treeElement dataSource treeElement: self widgetContent ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrTreeAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenChanged do: [ :anEvent | self root: anEvent root ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ].
	self when: BrTreeNodeTypeStencilChangedEvent do: [ :anEvent | self onNodeTypeStencilChanged: anEvent nodeTypeStencil ].
	self when: BrTreeNodeIdStencilChangedEvent do: [ :anEvent | self onNodeIdStencilChanged: anEvent nodeIdStencil ].
	
	self initializeScrollListeners
]

{ #category : #initialization }
BrTreeAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrTreeNodeTypeStencilRequest new.
	self request: BrTreeNodeIdStencilRequest new.
	self request: BrTreeChildrenRequest new.
	self request: BrSelectionRequest new.
]

{ #category : #initialization }
BrTreeAptitude >> initializeScrollListeners [
	self
		when: BrScrollByWish
		do: [ :aWish | self onScrollBy: aWish ].

	self
		when: BrScrollToItemWish
		do: [ :aWish | self onScrollToItem: aWish ]
]

{ #category : #hooks }
BrTreeAptitude >> onNodeIdStencilChanged: aBrTreeNodeIdStencilBuilder [
	treeElement dataSource nodeIdStencil: aBrTreeNodeIdStencilBuilder
]

{ #category : #hooks }
BrTreeAptitude >> onNodeTypeStencilChanged: aBrTreeNodeTypeStencilBuilder [
	treeElement dataSource nodeTypeStencil: aBrTreeNodeTypeStencilBuilder
]

{ #category : #hooks }
BrTreeAptitude >> onScrollBy: aWish [
	aWish smooth
		ifTrue: [ treeElement smoothScrollBy: aWish delta ]
		ifFalse: [ treeElement scrollBy: aWish delta ]
]

{ #category : #hooks }
BrTreeAptitude >> onScrollToItem: aWish [
	aWish smooth
		ifTrue: [ treeElement smoothScrollToPosition: aWish index ]
		ifFalse: [ treeElement scrollToPosition: aWish index ]
]

{ #category : #hooks }
BrTreeAptitude >> onSelectionChanged: aCollectionOfIndices [
	treeElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]

{ #category : #initialization }
BrTreeAptitude >> root: aTreeNode [
	treeElement dataSource rootNode: aTreeNode
]

{ #category : #initialization }
BrTreeAptitude >> treeElement [
	^ treeElement
]
