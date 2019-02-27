Class {
	#name : #BrSimpleTree,
	#superclass : #BrTree,
	#category : #'Brick-Tree - UI'
}

{ #category : #initialization }
BrSimpleTree >> defaultTreeModel [
	^ BrSimpleTreeModel new
]

{ #category : #initialization }
BrSimpleTree >> initialize [
	super initialize.
	
	self look: BrSimpleTreeLook new
]

{ #category : #accessing }
BrSimpleTree >> root: anObject computed: aComputationBlock [
	self viewModel root: anObject computed: aComputationBlock
]
