Class {
	#name : #BrColumnedListRowElementStencilBuilder,
	#superclass : #BrListItemElementStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding'
	],
	#category : #'Brick-List - Stencil'
}

{ #category : #'api - instantiation' }
BrColumnedListRowElementStencilBuilder >> buildDefault [
	^ BlElement new
		layout: (BlLinearLayout horizontal alignCenterLeft cellSpacing: self cellSpacing);
		padding: self padding;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #accessing }
BrColumnedListRowElementStencilBuilder >> cellSpacing [
	^ cellSpacing
]

{ #category : #accessing }
BrColumnedListRowElementStencilBuilder >> cellSpacing: anObject [
	cellSpacing := anObject
]

{ #category : #initialization }
BrColumnedListRowElementStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty
]

{ #category : #accessing }
BrColumnedListRowElementStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrColumnedListRowElementStencilBuilder >> padding: anObject [
	padding := anObject
]
