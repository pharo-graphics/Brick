Class {
	#name : #BrVerticalFlowAptitude,
	#superclass : #BrWidgetContainerAptitude,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalFlowAptitude >> initialize [
	super initialize.

	self add: BrLayoutAlignmentAptitude forVerticalFlowLayout
]
