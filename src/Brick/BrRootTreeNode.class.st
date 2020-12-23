Class {
	#name : #BrRootTreeNode,
	#superclass : #BrTreeNode,
	#instVars : [
		'announcer',
		'isLazy'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #'instance creation' }
BrRootTreeNode class >> on: anObject computed: aComputationBlock [
	self
		deprecated: 'Use #onMany:computed: instead'
		transformWith: '`@receiver on: `@statements1 computed: `@statements2' -> '`@receiver onMany: `@statements1 computed: `@statements2'.

	^ self onMany: anObject computed: aComputationBlock
]

{ #category : #'instance creation' }
BrRootTreeNode class >> onMany: aCollection computed: aComputationBlock [
	"Created a root tree node on a collection of items"

	^ self new
		lazy: true;
		value: aCollection
		computation: (BrTreeManyNodesComputation new block: aComputationBlock)
		withSelf: false
]

{ #category : #'instance creation' }
BrRootTreeNode class >> onMany: aCollection immediate: aComputationBlock [
	"Created a root tree node on a collection of items"

	^ (self new
		lazy: false;
		value: aCollection
		computation: (BrTreeManyNodesComputation new block: aComputationBlock)
		withSelf: false) ensureChildrenNodes
]

{ #category : #'instance creation' }
BrRootTreeNode class >> onOne: anObject computed: aComputationBlock [
	"Created a root tree node on a single root item"

	^ self new
		lazy: true;
		value: anObject
		computation: (BrTreeOneNodeComputation new block: aComputationBlock)
		withSelf: true
]

{ #category : #'instance creation' }
BrRootTreeNode class >> onOne: anObject immediate: aComputationBlock [
	"Created a root tree node on a single root item"

	^ (self new
		lazy: false;
		value: anObject
		computation: (BrTreeOneNodeComputation new block: aComputationBlock)
		withSelf: true) ensureChildrenNodes
]

{ #category : #accessing }
BrRootTreeNode >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
BrRootTreeNode >> depth [
	^ 0
]

{ #category : #'api - expandable' }
BrRootTreeNode >> expandSuchThat: anOneArgBlock [
	computation expand: self suchThat: anOneArgBlock
]

{ #category : #initialization }
BrRootTreeNode >> initialize [
	super initialize.
	
	isLazy := true
]

{ #category : #testing }
BrRootTreeNode >> isAccountedForSelf [		
	^ self indexInTree > 0
]

{ #category : #testing }
BrRootTreeNode >> isLazy [
	^ isLazy
]

{ #category : #accessing }
BrRootTreeNode >> lazy: aBoolean [
	isLazy := aBoolean
]

{ #category : #initialization }
BrRootTreeNode >> newSubNode: anObject computation: aComputationBlock [
	^ self isLazy
		ifTrue: [ BrLazyTreeNode new value: anObject computation: aComputationBlock block ]
		ifFalse: [ (BrImmediateTreeNode new value: anObject computation: aComputationBlock block) ]
]

{ #category : #hooks }
BrRootTreeNode >> onChildCollapsed: aChildNode from: anOriginNode size: anAmount [
	super onChildCollapsed: aChildNode from: anOriginNode size: anAmount.
	
	self announcer announce: (BrTreeNodeCollapsed new
		from: anOriginNode indexInTree + 1;
		to: anOriginNode indexInTree + anAmount;
		node: anOriginNode)
]

{ #category : #hooks }
BrRootTreeNode >> onChildExpanded: aChildNode from: anOriginNode size: anAmount [
	super onChildExpanded: aChildNode from: anOriginNode size: anAmount.

	self announcer announce: (BrTreeNodeExpanded new
		from: anOriginNode indexInTree + 1;
		to: anOriginNode indexInTree + anAmount;
		node: anOriginNode)
]

{ #category : #hooks }
BrRootTreeNode >> onChildInserted: anOriginNode size: anAmount [
	super onChildInserted: anOriginNode size: anAmount.
	self announcer
		announce:
			(BrTreeNodeInserted new
				from: anOriginNode indexInTree;
				to: anOriginNode indexInTree + anAmount - 1;
				node: anOriginNode)
]

{ #category : #hooks }
BrRootTreeNode >> onChildRemoved: anOriginNode size: anAmount [
	super onChildRemoved: anOriginNode size: anAmount.
	self announcer
		announce:
			(BrTreeNodeRemoved new
				from: anOriginNode indexInTree;
				to: anOriginNode indexInTree + anAmount - 1;
				node: anOriginNode)
]

{ #category : #hooks }
BrRootTreeNode >> onNodeChanged: aTreeNode payload: anObject [
	super onNodeChanged: aTreeNode payload: anObject.
	self announcer
		announce:
			(BrTreeNodeChanged new
				index: aTreeNode indexInTree;
				node: aTreeNode;
				payload: anObject)
]
