"
I should be applied on buttons that play a role of a dropdown toggle look
"
Class {
	#name : #BrGlamorousDropdownToggleLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #initialization }
BrGlamorousDropdownToggleLook >> initialize [
	super initialize.

	self expanded: [ :aWidget |
		aWidget
			background: Color transparent;
			border: BlBorder empty ]
]
