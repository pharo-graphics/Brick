Class {
	#name : #BrGlamorousDropdownLook,
	#superclass : #BrDropdownLook,
	#instVars : [
		'anchoredLook'
	],
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'api - text style' }
BrGlamorousDropdownLook >> background: aBlBackground [
	anchoredLook background: aBlBackground
]

{ #category : #'api - text style' }
BrGlamorousDropdownLook >> cornerRadius: aNumber [
	anchoredLook cornerRadius: aNumber
]

{ #category : #'instance creation' }
BrGlamorousDropdownLook >> initialize [
	super initialize.

	self add: (anchoredLook := BrGlamorousAnchoredLook new)
]
