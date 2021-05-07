"
I arrange my children horizontally in a flow layout
"
Class {
	#name : #BrHorizontalFlow,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrHorizontalFlow >> initialize [
	super initialize.

	self aptitude: BrHorizontalFlowAptitude new
]
