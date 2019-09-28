Class {
	#name : #BrTreeChildrenChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'root'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeChildrenChanged >> root [
	<return: #BrTreeNode>

	^ root
]

{ #category : #accessing }
BrTreeChildrenChanged >> root: aTreeNode [
	root := aTreeNode
]
