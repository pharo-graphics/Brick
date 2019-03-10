Class {
	#name : #BrTreeNodeExpanded,
	#superclass : #Announcement,
	#instVars : [
		'from',
		'to',
		'node'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeExpanded >> from [
	^ from
]

{ #category : #accessing }
BrTreeNodeExpanded >> from: anObject [
	from := anObject
]

{ #category : #accessing }
BrTreeNodeExpanded >> node [
	^ node
]

{ #category : #accessing }
BrTreeNodeExpanded >> node: anObject [
	node := anObject
]

{ #category : #accessing }
BrTreeNodeExpanded >> to [
	^ to
]

{ #category : #accessing }
BrTreeNodeExpanded >> to: anObject [
	to := anObject
]
