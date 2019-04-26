Class {
	#name : #BrFlowList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrFlowList >> initialize [
	super initialize.

	self look: BrFlowListLook new + BrLayoutLook frame matchParent
]

{ #category : #accessing }
BrFlowList >> stencil: aListRowStencilBuilder [
	self look itemStencilBuilder: aListRowStencilBuilder
]
