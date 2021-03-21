Class {
	#name : #BrTreeNodeInserted,
	#superclass : #BrTreeNodeAnnouncement,
	#instVars : [
		'node',
		'from',
		'to'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeInserted >> from [
	^ from
]

{ #category : #accessing }
BrTreeNodeInserted >> from: anObject [
	from := anObject
]

{ #category : #accessing }
BrTreeNodeInserted >> node [
	^ node
]

{ #category : #accessing }
BrTreeNodeInserted >> node: anObject [
	node := anObject
]

{ #category : #accessing }
BrTreeNodeInserted >> to [
	^ to
]

{ #category : #accessing }
BrTreeNodeInserted >> to: anObject [
	to := anObject
]
