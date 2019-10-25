Class {
	#name : #BrHorizontalPaneLook,
	#superclass : #BrWidgetContainerLook,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalPaneLook >> initialize [
	super initialize.

	self add: BrLayoutAlignmentLook forAlignable
]
