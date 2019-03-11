Class {
	#name : #BrGlamorousDropdownToggleButtonWithLabelAndIconLook,
	#superclass : #BrGlamorousButtonWithLabelAndIconLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #initialization }
BrGlamorousDropdownToggleButtonWithLabelAndIconLook >> initialize [
	super initialize.
	
	self add: (BrInteractiveCommonLook new
		expanded: [ :aWidget | aWidget border: BlBorder empty ] )
]
