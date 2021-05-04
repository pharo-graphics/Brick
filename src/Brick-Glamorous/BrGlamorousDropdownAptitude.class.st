Class {
	#name : #BrGlamorousDropdownAptitude,
	#superclass : #BrDropdownAptitude,
	#instVars : [
		'anchoredLook'
	],
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'api - text style' }
BrGlamorousDropdownAptitude >> background: aBlBackground [
	anchoredLook background: aBlBackground
]

{ #category : #'api - text style' }
BrGlamorousDropdownAptitude >> cornerRadius: aNumber [
	anchoredLook cornerRadius: aNumber
]

{ #category : #'instance creation' }
BrGlamorousDropdownAptitude >> initialize [
	super initialize.

	self add: (anchoredLook := BrGlamorousAnchoredAptitude new)
]
