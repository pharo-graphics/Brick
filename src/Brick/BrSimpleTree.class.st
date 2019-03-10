Class {
	#name : #BrSimpleTree,
	#superclass : #BrTree,
	#category : #'Brick-Tree - UI'
}

{ #category : #initialization }
BrSimpleTree >> initialize [
	super initialize.
	
	self look: BrSimpleTreeLook new
]

{ #category : #accessing }
BrSimpleTree >> stencil: aTreeRowStencilBuilder [
	"Astencil builder can be a valuable of the form [ :aTreeNode :anIndex :aTreeWidget | ]"

	self look itemStencilBuilder: aTreeRowStencilBuilder
]
