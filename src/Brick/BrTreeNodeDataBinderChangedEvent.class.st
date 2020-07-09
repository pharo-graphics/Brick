Class {
	#name : #BrTreeNodeDataBinderChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'nodeDataBinder'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeDataBinderChangedEvent >> nodeDataBinder [
	^ nodeDataBinder
]

{ #category : #accessing }
BrTreeNodeDataBinderChangedEvent >> nodeDataBinder: anObject [
	nodeDataBinder := anObject
]
