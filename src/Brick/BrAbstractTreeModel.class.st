Class {
	#name : #BrAbstractTreeModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'rootNode',
		'nodeTypeStencil'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #'expanding-collapsing' }
BrAbstractTreeModel >> collapseAll [
	self root allChildrenNodesBreadthFirstDo: [ :eachNode | eachNode collapse ].
	self root expand.
]

{ #category : #'expanding-collapsing' }
BrAbstractTreeModel >> collapseAt: aLevelIndex [
	self upToDepth: aLevelIndex do: [ :eachNode |
		eachNode depth + 1 = aLevelIndex ifTrue: [ eachNode collapse ] ].
]

{ #category : #'expanding-collapsing' }
BrAbstractTreeModel >> expandAll [
	self root withAllChildrenNodesBreadthFirstDo: [ :eachNode | eachNode expand ]
]

{ #category : #'expanding-collapsing' }
BrAbstractTreeModel >> expandUpTo: aLevelIndex [
	self root expandUpTo: aLevelIndex
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> indexOf: anObject [
	<return: #Number>
	| anIndex |
	
	anIndex := self root isAccountedForSelf
		ifTrue: [ 1 ]
		ifFalse: [ -1 ].

	self root withAllChildrenNodesLinearDo: [ :eachTreeNode |
		anIndex := anIndex + 1.
		eachTreeNode value = anObject
			ifTrue: [ ^ anIndex ] ].

	^ 0
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> indexOf: anObject do: aBlock [
	<return: #Number>
	| anIndex |
	
	anIndex := self indexOf: anObject.
	anIndex > 0
		ifTrue: [ aBlock value: anIndex ]
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> indexOfSuchThat: aBlock [
	<return: #Number>
	| anIndex aCheckBlock |
	
	anIndex := 0.
	
	aCheckBlock := [ :eachTreeNode |
		anIndex := anIndex + 1.
		(aBlock value: eachTreeNode value)
			ifTrue: [ ^ anIndex ] ].

	self root isAccountedForSelf
		ifTrue: [ self root withAllChildrenNodesLinearDo: aCheckBlock ]
		ifFalse: [ self root allChildrenNodesLinearDo: aCheckBlock ].

	^ 0
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> indexOfSuchThat: aBlock do: aFoundBlock [
	<return: #Number>
	| anIndex |
	
	anIndex := self indexOfSuchThat: aBlock.
	anIndex > 0
		ifTrue: [ aFoundBlock value: anIndex ]
]

{ #category : #initialization }
BrAbstractTreeModel >> initialize [
	super initialize.

	rootNode := BrRootTreeNode onMany: #() computed: [ :eachChild | #() ].
	nodeTypeStencil := BrTreeDefaultItemTypeStencilBuilder new
]

{ #category : #initialization }
BrAbstractTreeModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenRequest reply: [ :aResponse | aResponse root: self root ].
	self when: BrTreeNodeTypeStencilRequest reply: [ :aResponse | aResponse nodeTypeStencil: self nodeTypeStencil ].
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> itemAt: anIndex [
	<return: #BrTreeNode>

	^ self root at: anIndex
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> itemCount [
	<return: #Number>

	^ self root size
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> items: aCollectionOfItems children: aBlockOrValuable [
	rootNode := BrRootTreeNode onMany: aCollectionOfItems computed: aBlockOrValuable.
	rootNode expandUpTo: 2.

	self notifyChildrenChanged
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> items: aCollectionOfItems immediate: aBlockOrValuable [
	rootNode := BrRootTreeNode onMany: aCollectionOfItems immediate: aBlockOrValuable.
	rootNode expandUpTo: 2.

	self notifyChildrenChanged
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> nodeOf: anObject ifFound: aFoundBlock ifNone: anExceptionBlock [
	"Find a tree node for a given object, while computing the children nodes thus killing any laziness,
	Use me with cautious!"
	self root ensureChildrenNodes.

	self root withAllChildrenNodesLinearDo: [ :eachTreeNode |
		eachTreeNode ensureChildrenNodes.
		eachTreeNode value = anObject
			ifTrue: [ ^ aFoundBlock value: eachTreeNode ] ].

	^ anExceptionBlock value
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> nodeTypeStencil [
	"Return a stencil that is used to create a node type of a given tree node"
	<return: #BrTreeNodeTypeStencilBuilder>

	^ nodeTypeStencil
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> nodeTypeStencil: aStencil [
	"Set a stencil that will be used to compute the node type"

	nodeTypeStencil := aStencil asStencilBuilder: BrTreeNodeTypeStencilBuilder.
	self dispatchEvent: (BrTreeNodeTypeStencilChangedEvent new nodeTypeStencil: nodeTypeStencil)
]

{ #category : #notifying }
BrAbstractTreeModel >> notifyChildrenChanged [
	self dispatchEvent: (BrTreeChildrenChanged new root: self root)
]

{ #category : #'api - accessing' }
BrAbstractTreeModel >> root [
	<return: #BrRootTreeNode>

	^ rootNode
]

{ #category : #'expanding-collapsing' }
BrAbstractTreeModel >> upToDepth: aMaxDepthLevel do: anOneArgBlock [
	self root upToDepth: aMaxDepthLevel do: anOneArgBlock
]
