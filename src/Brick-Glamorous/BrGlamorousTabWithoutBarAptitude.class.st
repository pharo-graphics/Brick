Class {
	#name : #BrGlamorousTabWithoutBarAptitude,
	#superclass : #BrTabAptitude,
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabWithoutBarAptitude >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelAptitude new foreground: Color black).
	self add: BrLayoutResizerAptitude inherit.
	self add: (BrLayoutAlignmentAptitude forHorizontalLinearLayout).
	
	self add: (BrStyleCommonAptitude new
		default: [ :aStyle | aStyle padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12) ])
]
