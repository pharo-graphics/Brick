Class {
	#name : #BrWidgetContainerAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrWidgetContainerAptitude >> initialize [
	super initialize.
	
	self add: BrLayoutResizerAptitude inherit
]
