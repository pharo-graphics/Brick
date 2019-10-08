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
	self root withAllChildrenNodesBreadthFirstDo: [ :eachNode | eachNode collapse ]
]

{ #category : #'expanding-collapsing' }
BrTreeModel >> expandAll [
	self root withAllChildrenNodesBreadthFirstDo: [ :eachNode | eachNode expand ]
]

{ #category : #'expanding-collapsing' }
BrTreeModel >> expandUpTo: aLevelIndex [
	self upToLevel: aLevelIndex do: [ :eachNode | eachNode expand ].
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
BrTreeModel >> upToLevel: aLevelIndex do: anOneArgBlock [
	| aCurrentLevel | 
	self 
		assert: [ aLevelIndex isInteger and: [ aLevelIndex > 0 ] ] 
		description: [ 'Level index must be a natural number' ].
	aCurrentLevel := 0.
	self root withAllChildrenNodesBreadthFirstDo: [ :eachNode | 
		anOneArgBlock cull: eachNode.
		aCurrentLevel := aCurrentLevel + 1.
		aCurrentLevel > aLevelIndex ifTrue: [ ^ self ] ].
]
