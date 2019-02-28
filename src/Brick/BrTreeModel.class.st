Class {
	#name : #BrTreeModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'rootNode'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #accessing }
BrTreeModel >> computation [
	^ rootNode computation
]

{ #category : #'api - tree' }
BrTreeModel >> expandRoot [
	rootNode expand
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

{ #category : #accessing }
BrTreeModel >> rootValue [
	^ rootNode value
]
