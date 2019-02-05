Class {
	#name : #BrGridList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrGridList >> defaultListModel [
	^ BrSimpleListModel new
]

{ #category : #initialization }
BrGridList >> initialize [
	super initialize.

	self look: BrGridListLook new + BrLayoutLook frame matchParent
]

{ #category : #accessing }
BrGridList >> stencil: aListRowStencilBuilder [
	self look itemStencilBuilder: aListRowStencilBuilder
]
