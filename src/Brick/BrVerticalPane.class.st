"
I arrange my children in one vertical column, one by one
"
Class {
	#name : #BrVerticalPane,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalPane >> initialize [
	super initialize.

	self look: BrVerticalPaneLook new
]
