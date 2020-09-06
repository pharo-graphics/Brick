Class {
	#name : #BrTreeNodeInserted,
	#superclass : #BrTreeNodeAnnouncement,
	#instVars : [
		'node',
		'index'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeInserted >> index [
	^ index
]

{ #category : #accessing }
BrTreeNodeInserted >> index: anObject [
	index := anObject
]

{ #category : #accessing }
BrTreeNodeInserted >> node [
	^ node
]

{ #category : #accessing }
BrTreeNodeInserted >> node: anObject [
	node := anObject
]
