Class {
	#name : #BrFrameAptitude,
	#superclass : #BrWidgetContainerAptitude,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrFrameAptitude >> initialize [
	super initialize.

	self add: BrLayoutAlignmentAptitude forFrameLayout
]
