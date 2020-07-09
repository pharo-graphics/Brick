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

	^ self viewModel column
]

{ #category : #initialization }
BrColumnedList >> defaultListModel [
	^ BrColumnedListModel new
]

{ #category : #initialization }
BrColumnedList >> initialize [
	super initialize.

	self look: BrColumnedListLook new
]

{ #category : #'api - scripting' }
BrColumnedList >> rowStencil: aRowStencil [
	self look rowStencilBuilder: aRowStencil
]
