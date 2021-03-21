Class {
	#name : #BrVerticalPaneLook,
	#superclass : #BrWidgetContainerLook,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalPaneLook >> initialize [
	super initialize.

	self add: BrLayoutAlignmentLook forAlignable
]
