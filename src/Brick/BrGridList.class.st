Class {
	#name : #BrGridList,
	#superclass : #BrList,
	#category : #'Brick-List - UI'
}

{ #category : #initialization }
BrGridList >> initialize [
	super initialize.

	self aptitude: BrGridListAptitude new.
	self layout: BlFrameLayout new.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
]

{ #category : #accessing }
BrGridList >> stencil: aListRowStencilBuilder [
	self aptitude itemStencilBuilder: aListRowStencilBuilder
]
