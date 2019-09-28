Class {
	#name : #BrColumnedList,
	#superclass : #BrList,
	#instVars : [
		'columnedModel'
	],
	#category : #'Brick-List - UI'
}

{ #category : #'api - scripting' }
BrColumnedList >> column [
	<return: #BrColumn>

	^ columnedModel column
]

{ #category : #initialization }
BrColumnedList >> initialize [
	super initialize.

	self viewModel add: (columnedModel := BrColumnedModel new).

	self look: BrColumnedListLook new.
	self rowStencil: BrListClickableRowStencilBuilder new
]

{ #category : #'api - scripting' }
BrColumnedList >> rowStencil: aRowStencil [
	self look rowStencilBuilder: aRowStencil
]
