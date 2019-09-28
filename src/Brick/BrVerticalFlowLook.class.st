Class {
	#name : #BrVerticalFlowLook,
	#superclass : #BrWidgetContainerLook,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalFlowLook >> initialize [
	super initialize.

	self add: BrLayoutAlignmentLook forVerticalFlowLayout
]
