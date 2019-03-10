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
	<return: #BlColumn>

	^ columnedModel column
]

{ #category : #initialization }
BrColumnedTree >> initialize [
	super initialize.

	self viewModel add: (columnedModel := BrColumnedModel new).

	self look: BrColumnedListLook new.
	self rowStencil: BrListClickableRowStencilBuilder new
]

{ #category : #'api - scripting' }
BrColumnedTree >> rowStencil: aRowStencil [
	self look rowStencilBuilder: aRowStencil
]
