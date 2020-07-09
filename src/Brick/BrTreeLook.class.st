Class {
	#name : #BrTreeLook,
	#superclass : #BrLook,
	#instVars : [
		'treeElement',
		'scrollbar'
	],
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrTreeLook >> initialize [
	super initialize.
	treeElement := BrInfiniteTreeElement new.
	self add: (BrLayoutResizerLook inherit inherit: treeElement).
	self addChangeAddChildAs: #(content tree) with: [ treeElement ].
	scrollbar := (BrGlamorousVerticalScrollbarStencil new scrollable: treeElement) asElement.
	self addChangeAddChildAs: #(content scrollbar) with: [ scrollbar ].
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
BrTreeLook >> onSelectionChanged: aCollectionOfIndices [
	treeElement dataSource selection: (BlCompositeSelection fromIndices: aCollectionOfIndices)
]

{ #category : #initialization }
BrTreeLook >> root: aTreeNode [
	treeElement dataSource rootNode: aTreeNode
]
