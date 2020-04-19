Class {
	#name : #BrTreeModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'rootNode'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #'expanding-collapsing' }
BrTreeModel >> collapseAll [
	self root allChildrenNodesBreadthFirstDo: [ :eachNode | eachNode collapse ].
	self root expand.
]

{ #category : #'expanding-collapsing' }
BrTreeModel >> collapseAt: aLevelIndex [
	self upToDepth: aLevelIndex do: [ :eachNode |
		eachNode depth + 1 = aLevelIndex ifTrue: [ eachNode collapse ] ].
]

{ #category : #'expanding-collapsing' }
BrTreeModel >> expandAll [
	self root withAllChildrenNodesBreadthFirstDo: [ :eachNode | eachNode expand ]
]

{ #category : #'expanding-collapsing' }
BrTreeModel >> expandUpTo: aLevelIndex [
	self upToDepth: aLevelIndex do: [ :eachNode | eachNode expand ].
]

{ #category : #accessing }
BrTreeModel >> indexOf: anObject [
	<return: #Number>
	| anIndex |
	
	anIndex := self root isHidden
		ifTrue: [ -1 ]
		ifFalse: [ 0 ].

	self root withAllChildrenNodesLinearDo: [ :eachTreeNode |
		anIndex := anIndex + 1.
		eachTreeNode value = anObject
			ifTrue: [ ^ anIndex ] ].

	^ 0
]

{ #category : #accessing }
BrTreeModel >> indexOf: anObject do: aBlock [
	<return: #Number>
	| anIndex |
	
	anIndex := self indexOf: anObject.
	anIndex > 0
		ifTrue: [ aBlock value: anIndex ]
]

{ #category : #initialization }
BrTreeModel >> initialize [
	super initialize.

	rootNode := BrTreeNode on: nil computed: [ :eachChild | #() ]
]

{ #category : #initialization }
BrTreeModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenRequest reply: [ :aResponse | aResponse root: self root ]
]

{ #category : #accessing }
BrTreeModel >> itemAt: anIndex [
	<return: #BrTreeNode>

	^ self root at: anIndex
]

{ #category : #accessing }
BrTreeModel >> itemCount [
	<return: #Number>

	^ self root size
]

{ #category : #accessing }
BrTreeModel >> items: aCollectionOfItems children: aBlockOrValuable [

	rootNode := BrTreeNode on: aCollectionOfItems computed: #value.
	rootNode children: aCollectionOfItems computed: aBlockOrValuable.
	rootNode hide.
	rootNode expand.

	self notifyChildrenChanged
]

{ #category : #notifying }
BrTreeModel >> notifyChildrenChanged [
	self dispatchEvent: (BrTreeChildrenChanged new root: self root)
]

{ #category : #accessing }
BrTreeModel >> root [
	<return: #BrTreeNode>

	^ rootNode
]

{ #category : #'expanding-collapsing' }
BrTreeModel >> upToDepth: aMaxDepthLevel do: anOneArgBlock [
	self 
		assert: [ aMaxDepthLevel isInteger and: [ aMaxDepthLevel > 0 ] ] 
		description: [ 'Level index must be a natural number' ].
	self root withAllChildrenNodesBreadthFirstDo: [ :eachNode | 
		eachNode depth >= aMaxDepthLevel ifTrue: [ ^ self ].
		anOneArgBlock cull: eachNode ].
]
