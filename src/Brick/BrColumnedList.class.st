Class {
	#name : #BrColumnedList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #'api - scripting' }
BrColumnedList >> column [
	<return: #BlListColumn>

	^ self viewModel column
]

{ #category : #initialization }
BrColumnedList >> defaultListModel [
	^ BrColumnedListModel new
]

{ #category : #initialization }
BrColumnedList >> initialize [
	super initialize.

	self look: BrColumnedListLook new + BrLayoutLook frame matchParent.
	self rowStencil: BrListClickableRowStencilBuilder new
]

{ #category : #'api - scripting' }
BrColumnedList >> rowStencil: aRowStencil [
	self look rowStencilBuilder: aRowStencil
]
