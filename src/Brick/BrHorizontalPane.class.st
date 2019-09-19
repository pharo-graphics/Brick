"
I arrange my children in one horizontal row, one by one
"
Class {
	#name : #BrHorizontalPane,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalPane >> initialize [
	super initialize.

	self look: BrHorizontalPaneLook new
]
