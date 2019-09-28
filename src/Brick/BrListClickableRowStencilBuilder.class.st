Class {
	#name : #BrListClickableRowStencilBuilder,
	#superclass : #BrColumnedListRowStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrListClickableRowStencilBuilder >> buildDefault [
	| aList anIndex |
	aList := self listElement.
	anIndex := self rowIndex.

	^ BlElement new
		layout: (BlLinearLayout horizontal alignCenterLeft cellSpacing: self cellSpacing);
		padding: self padding;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		when: BlClickEvent
			do: [ :anEvent | 
			anEvent consumed: true.
			aList selectOne: anIndex dueTo: anEvent.
			aList requestFocus ];
		when: BlDoubleClickEvent
			do: [ :anEvent |
			anEvent consumed: true.
			aList dispatchEvent: (BrSelectionDoubleClicked new selection: aList selection; sourceEvent: anEvent) ]
]

{ #category : #accessing }
BrListClickableRowStencilBuilder >> cellSpacing [
	<return: #Number>

	^ cellSpacing
]

{ #category : #accessing }
BrListClickableRowStencilBuilder >> cellSpacing: aNumber [
	cellSpacing := aNumber
]

{ #category : #initialization }
BrListClickableRowStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty
]

{ #category : #accessing }
BrListClickableRowStencilBuilder >> padding [
	<return: #BlInsets>

	^ padding
]

{ #category : #accessing }
BrListClickableRowStencilBuilder >> padding: aBlInsets [
	padding := aBlInsets
]
