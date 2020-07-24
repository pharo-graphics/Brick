Class {
	#name : #BrTreeLook,
	#superclass : #BrLook,
	#instVars : [
		'treeElement'
	],
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrTreeLook >> initialize [
	super initialize.
	treeElement := BrInfiniteTreeElement new.
	self add: (BrLayoutResizerLook inherit inherit: treeElement).
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
BrTreeLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenChanged do: [ :anEvent | self root: anEvent root ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent indices ].
	self when: BrTreeNodeTypeStencilChangedEvent do: [ :anEvent | self onNodeTypeStencilChanged: anEvent nodeTypeStencil ].
	
	self
		when: BrScrollByWish
		do: [ :aWish | self onScrollBy: aWish ].

	self
		when: BrScrollToItemWish
		do: [ :aWish | self onScrollToItem: aWish ]
]

{ #category : #initialization }
BrTreeLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTreeChildrenRequest new.
	self request: BrSelectionRequest new.
	self request: BrTreeNodeTypeStencilRequest new.
]

{ #category : #hooks }
BrTreeLook >> onNodeTypeStencilChanged: aBrTreeNodeTypeStencilBuilder [
	treeElement dataSource nodeTypeStencil: aBrTreeNodeTypeStencilBuilder
]

{ #category : #hooks }
BrTreeLook >> onScrollBy: aWish [
	aWish smooth
		ifTrue: [ treeElement smoothScrollBy: aWish delta ]
		ifFalse: [ treeElement scrollBy: aWish delta ]
]

{ #category : #hooks }
BrTreeLook >> onScrollToItem: aWish [
	aWish smooth
		ifTrue: [ treeElement smoothScrollToPosition: aWish index ]
		ifFalse: [ treeElement scrollToPosition: aWish index ]
]

{ #category : #hooks }
BrTreeLook >> onSelectionChanged: aCollectionOfIndices [
	treeElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]

{ #category : #initialization }
BrTreeLook >> root: aTreeNode [
	treeElement dataSource rootNode: aTreeNode
]
