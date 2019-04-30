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
	changes
		add: (#(content tree) asBrLookChildAddAsChangeWithValue: [ treeElement ]).
	changes
		add:
			(#(widgetContent layout)
				asBrLookPropertyChangeWithValue: [ BlLinearLayout vertical ])
]

{ #category : #initialization }
BrTreeLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenChanged do: [ :anEvent | self root: anEvent root ].
	self when: BrSelectionChanged do: [ :anEvent | self onSelectionChanged: anEvent selection ]
]

{ #category : #initialization }
BrTreeLook >> initializeLook [
	super initializeLook.
	treeElement dataSource treeElement: self widgetContent
]

{ #category : #initialization }
BrTreeLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrTreeChildrenRequest new.
	self request: BrSelectionRequest new
]

{ #category : #hooks }
BrTreeLook >> onSelectionChanged: aBlSelection [
	treeElement dataSource selection: aBlSelection
]

{ #category : #initialization }
BrTreeLook >> root: aTreeNode [
	treeElement dataSource rootNode: aTreeNode
]

{ #category : #initialization }
BrTreeLook >> rowStencilBuilder: aStencilBuilder [
	| aRowStencilBuilder |
	"aStencilBuilder is expected to be a subclass of BrTreeRowStencilBuilder or a valuable"
	aRowStencilBuilder := aStencilBuilder asStencilBuilder: BrTreeRowStencilBuilder.

	treeElement dataSource rowStencilBuilder: aRowStencilBuilder
]
