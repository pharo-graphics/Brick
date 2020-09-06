Class {
	#name : #BrTreeNodeRemoved,
	#superclass : #BrTreeNodeAnnouncement,
	#instVars : [
		'node',
		'from',
		'to'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeRemoved >> from [
	^ from
]

{ #category : #accessing }
BrTreeNodeRemoved >> from: anObject [
	from := anObject
]

{ #category : #accessing }
BrTreeNodeRemoved >> node [
	^ node
]

{ #category : #accessing }
BrTreeNodeRemoved >> node: anObject [
	node := anObject
]

{ #category : #accessing }
BrTreeNodeRemoved >> to [
	^ to
]

{ #category : #accessing }
BrTreeNodeRemoved >> to: anObject [
	to := anObject
]
