Class {
	#name : #BrColumnedListRowStencilBuilder,
	#superclass : #BrListRowStencilBuilder,
	#category : 'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnedListRowStencilBuilder >> buildDefault [
	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]
