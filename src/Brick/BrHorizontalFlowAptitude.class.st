Class {
	#name : #BrHorizontalFlowAptitude,
	#superclass : #BrWidgetContainerAptitude,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalFlowAptitude >> initialize [
	super initialize.

	self add: BrLayoutAlignmentAptitude forHorizontalFlowLayout
]
