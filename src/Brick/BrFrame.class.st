"
I arrange my children on top of each other based on they own alignment
"
Class {
	#name : #BrFrame,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrFrame >> initialize [
	super initialize.

	self aptitude: BrFrameAptitude new
]
