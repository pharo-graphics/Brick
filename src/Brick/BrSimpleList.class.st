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
BrSimpleList >> stencil: aBrListRowStencilBuilder [
	"A stencil builder can be a valuable of the form [ :aRowValue :anIndex :aListWidget | ]"

	self look itemStencilBuilder: aBrListRowStencilBuilder
]
