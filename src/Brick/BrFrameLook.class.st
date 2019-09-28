Class {
	#name : #BrFrameLook,
	#superclass : #BrWidgetContainerLook,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrFrameLook >> initialize [
	super initialize.

	self add: BrLayoutAlignmentLook forFrameLayout
]
