Class {
	#name : #BrSimpleList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrSimpleList >> initialize [
	super initialize.

	self look: BrSimpleListLook new
]

{ #category : #'api - scripting' }
BrSimpleList >> stencil: aListRowStencilBuilder [
	self look itemStencilBuilder: aListRowStencilBuilder
]
