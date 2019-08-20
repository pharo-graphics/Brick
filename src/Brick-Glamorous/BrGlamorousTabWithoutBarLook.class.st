Class {
	#name : #BrGlamorousTabWithoutBarLook,
	#superclass : #BrTabLook,
	#category : #'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabWithoutBarLook >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelLook new foreground: Color black).
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).
	
	self add: (BrInteractiveCommonLook new
		default: [ :aWidget | aWidget padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12) ];
		disabled: [  ])
]
