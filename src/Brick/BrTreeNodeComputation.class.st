Class {
	#name : #BrTreeNodeComputation,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #'Brick-Tree - Model'
}

{ #category : #accessing }
BrTreeNodeComputation >> block [
	^ block
]

{ #category : #accessing }
BrTreeNodeComputation >> block: anObject [
	block := anObject
]

{ #category : #'api - expandable' }
BrTreeNodeComputation >> expand: aNode suchThat: anOneArgBlock [
	self subclassResponsibility
]

{ #category : #generated }
BrTreeNodeComputation >> value: anObject [
	^ self subclassResponsibility
]
