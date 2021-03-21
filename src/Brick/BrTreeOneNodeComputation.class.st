Class {
	#name : #BrTreeOneNodeComputation,
	#superclass : #BrTreeNodeComputation,
	#category : #'Brick-Tree - Model'
}

{ #category : #'api - expandable' }
BrTreeOneNodeComputation >> expand: aNode suchThat: anOneArgBlock [
	(anOneArgBlock value: aNode) ifFalse: [ ^ self ].
	aNode expand.
	aNode childrenNodesDo: [ :eachNode | 
		eachNode expandSuchThat: anOneArgBlock ]
]

{ #category : #generated }
BrTreeOneNodeComputation >> value: anObject [
	^ self block value: anObject 
]
