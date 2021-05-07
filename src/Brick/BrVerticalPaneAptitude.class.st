Class {
	#name : #BrVerticalPaneAptitude,
	#superclass : #BrWidgetContainerAptitude,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalPaneAptitude >> initialize [
	super initialize.

	self add: BrLayoutAlignmentAptitude forAlignable
]
