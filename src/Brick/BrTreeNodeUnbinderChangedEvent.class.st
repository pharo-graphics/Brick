Class {
	#name : #BrTreeNodeUnbinderChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'nodeUnbinder'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeNodeUnbinderChangedEvent >> nodeUnbinder [
	^ nodeUnbinder
]

{ #category : #accessing }
BrTreeNodeUnbinderChangedEvent >> nodeUnbinder: anObject [
	nodeUnbinder := anObject
]
