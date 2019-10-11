"
I should be applied on buttons that play a role of a dropdown toggle look
"
Class {
	#name : #OLDBrGlamorousDropdownToggleLook,
	#superclass : #BrInteractiveCommonLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #initialization }
OLDBrGlamorousDropdownToggleLook >> initialize [
	super initialize.

	self expanded: [ :aWidget |
		aWidget
			background: Color transparent;
			border: BlBorder empty ]
]
