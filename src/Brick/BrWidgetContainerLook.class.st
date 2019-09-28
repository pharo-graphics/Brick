Class {
	#name : #BrWidgetContainerLook,
	#superclass : #BrLook,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrWidgetContainerLook >> initialize [
	super initialize.
	
	self add: BrLayoutResizerLook inherit
]
