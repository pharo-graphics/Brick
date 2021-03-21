Class {
	#name : #BrTreeNodeChanged,
	#superclass : #BrTreeNodeAnnouncement,
	#instVars : [
		'node',
		'index',
		'payload'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeChanged >> index [
	^ index
]

{ #category : #accessing }
BrTreeNodeChanged >> index: anObject [
	index := anObject
]

{ #category : #accessing }
BrTreeNodeChanged >> node [
	^ node
]

{ #category : #accessing }
BrTreeNodeChanged >> node: anObject [
	node := anObject
]

{ #category : #accessing }
BrTreeNodeChanged >> payload [
	^ payload
]

{ #category : #accessing }
BrTreeNodeChanged >> payload: anObject [
	payload := anObject
]
