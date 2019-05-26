Class {
	#name : #BrGlamorousDropdownLook,
	#superclass : #BrDropdownLook,
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #initialization }
BrGlamorousDropdownLook >> initialize [
	super initialize.
	popupEmbellisher := BrGlamorousDropdownPopupEmbellisher new
]
