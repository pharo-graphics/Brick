"
I arrange my children vertically in a flow layout
"
Class {
	#name : #BrVerticalFlow,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalFlow >> initialize [
	super initialize.

	self look: BrVerticalFlowLook new
]
