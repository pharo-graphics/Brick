Class {
	#name : #BrTreeManyNodesComputation,
	#superclass : #BrTreeNodeComputation,
	#category : #'Brick-Tree - Model'
}

{ #category : #'api - expandable' }
BrTreeManyNodesComputation >> expand: aNode suchThat: anOneArgBlock [
	aNode expand.
	aNode childrenNodes do: [ :eachNode | 
		eachNode expandSuchThat: anOneArgBlock ]
]

{ #category : #generated }
BrTreeManyNodesComputation >> value: anObject [
	^ anObject
]
