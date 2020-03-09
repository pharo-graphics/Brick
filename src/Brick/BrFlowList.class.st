Class {
	#name : #BrFlowList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrFlowList >> initialize [
	super initialize.

	self look: BrFlowListLook new.
	self layout: BlFrameLayout new.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
]

{ #category : #accessing }
BrFlowList >> stencil: aListRowStencilBuilder [
	self look itemStencilBuilder: aListRowStencilBuilder
]
