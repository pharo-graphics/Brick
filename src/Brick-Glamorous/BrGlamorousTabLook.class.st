Class {
	#name : #BrGlamorousTabLook,
	#superclass : #BrTabLook,
	#instVars : [
		'bar'
	],
	#pools : [
		'BrGlamorousColors'
	],
	#category : 'Brick-Glamorous-Tabs'
}

{ #category : #initialization }
BrGlamorousTabLook >> initialize [
	super initialize.

	self add: BrGlamorousTabLabelLook new.

	bar := BlElement new.
	bar visibility: BlVisibility hidden.
	bar background: PrimaryBorderColor.
	bar constraintsDo: [ :c |
		c ignoreByLayout.
		c ignored vertical alignBottom.
		c vertical exact: 2.
		c horizontal matchParent ]
]

{ #category : #initialization }
BrGlamorousTabLook >> initializeLook [
	super initializeLook.

	self widgetContent
		layout: BlLinearLayout horizontal alignCenter;
		padding: (BlInsets top: 10 left: 12 bottom: 10 right: 12);
		constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal fitContent ];
		addChild: bar
]

{ #category : #'event handling' }
BrGlamorousTabLook >> tabDeselected [
	super tabDeselected.
	
	bar visibility: BlVisibility hidden
]

{ #category : #'event handling' }
BrGlamorousTabLook >> tabSelected [
	super tabSelected.
	
	bar visibility: BlVisibility visible
]
