Class {
	#name : #BrRootTreeNode,
	#superclass : #BrTreeNode,
	#instVars : [
		'announcer'
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
		value: aCollection
		computation: (BrTreeNodeIdentityComputation new block: aComputationBlock)
		withSelf: false
]

{ #category : #'instance creation' }
BrRootTreeNode class >> onOne: anObject computed: aComputationBlock [
	"Created a root tree node on a single root item"

	^ self new
		value: anObject
		computation: (BrTreeNodeBlockComputation new block: aComputationBlock)
		withSelf: true
]

{ #category : #accessing }
BrRootTreeNode >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #testing }
BrRootTreeNode >> isAccountedForSelf [		
	^ self indexInTree > 0
]

{ #category : #initialization }
BrRootTreeNode >> newSubNode: anObject computation: aComputationBlock [
	^ BrLazyTreeNode new value: anObject computation: aComputationBlock block
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
