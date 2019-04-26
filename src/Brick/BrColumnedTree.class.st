Class {
	#name : #BrColumnedTree,
	#superclass : #BrTree,
	#instVars : [
		'columnedModel'
	],
	#category : #'Brick-Tree - UI'
}

{ #category : #'api - scripting' }
BrColumnedTree >> column [
	<return: #BrColumn>

	^ columnedModel column
]

{ #category : #initialization }
BrColumnedTree >> initialize [
	super initialize.

	self viewModel add: (columnedModel := BrColumnedModel new).

	self look: BrColumnedTreeLook new
]

{ #category : #'api - scripting' }
BrColumnedTree >> rowStencil: aRowStencil [
	"A row stencil builder can be a valuable of the form [ :aTreeNode :anIndex :aTreeWidget | ]"

	self look rowStencilBuilder: aRowStencil
]
