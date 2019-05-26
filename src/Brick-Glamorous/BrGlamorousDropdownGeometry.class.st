Class {
	#name : #BrGlamorousDropdownGeometry,
	#superclass : #BlGeometry,
	#instVars : [
		'cornerRadius',
		'toggleExtent'
	],
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #accessing }
BrGlamorousDropdownGeometry >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> cornerRadius: anObject [
	cornerRadius := anObject
]

{ #category : #initialization }
BrGlamorousDropdownGeometry >> initialize [
	super initialize.
	cornerRadius := 5.
	toggleExtent := 50 @ 20
]

{ #category : #geometry }
BrGlamorousDropdownGeometry >> matchExtent: aPoint [
	extent := aPoint
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> toggleExtent [
	^ toggleExtent
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> toggleExtent: anObject [
	toggleExtent := anObject
]
