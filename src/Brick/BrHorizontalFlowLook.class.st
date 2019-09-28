Class {
	#name : #BrHorizontalFlowLook,
	#superclass : #BrWidgetContainerLook,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalFlowLook >> initialize [
	super initialize.

	self add: BrLayoutAlignmentLook forHorizontalFlowLayout
]
