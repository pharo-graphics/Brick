Class {
	#name : #BrHorizontalPaneAptitude,
	#superclass : #BrWidgetContainerAptitude,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalPaneAptitude >> initialize [
	super initialize.

	self add: BrLayoutAlignmentAptitude forAlignable
]
