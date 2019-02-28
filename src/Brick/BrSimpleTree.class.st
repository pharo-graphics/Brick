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
	"Set the root object and a computation block applied on each child recursively"

	self viewModel root: anObject computed: aComputationBlock
]

{ #category : #accessing }
BrSimpleTree >> stencil: aTreeRowStencilBuilder [
	"Astencil builder can be a valuable of the form [ :aTreeNode :anIndex :aTreeWidget | ]"

	self look itemStencilBuilder: aTreeRowStencilBuilder
]
