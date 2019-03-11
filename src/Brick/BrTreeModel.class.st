Class {
	#name : #BrTreeModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'rootNode',
		'isRootShown'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #initialization }
BrTreeModel >> initialize [
	super initialize.

	rootNode := BrTreeNode on: nil computed: [ :eachChild | #() ].
	isRootShown := false
]

{ #category : #initialization }
BrTreeModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrTreeChildrenRequest reply: [ :aResponse | aResponse root: self root ]
]

{ #category : #accessing }
BrTreeModel >> itemAt: anIndex [
	^ self root at: anIndex + (isRootShown not asBit)
]

{ #category : #accessing }
BrTreeModel >> items: aCollectionOfItems children: aBlockOrValuable [
	rootNode := BrTreeNode on: aCollectionOfItems computed: #value.
	rootNode children: aCollectionOfItems computed: aBlockOrValuable.
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

{ #category : #accessing }
BrTreeModel >> root: anObject computed: aBlockOrValuable [
	rootNode := BrTreeNode on: anObject computed: aBlockOrValuable.
	self notifyChildrenChanged
]
