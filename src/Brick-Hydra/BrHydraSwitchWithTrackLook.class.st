Class {
	#name : #BrHydraSwitchWithTrackLook,
	#superclass : #BrHydraSwitchLook,
	#instVars : [
		'track',
		'thumb',
		'cornerRadius'
	],
	#category : 'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchWithTrackLook >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrHydraSwitchWithTrackLook >> cornerRadius: aNumber [
	cornerRadius := aNumber.
	self widgetDo: [ self updateCornerRadius ]
]

{ #category : #initialization }
BrHydraSwitchWithTrackLook >> initialize [
	super initialize.
	
	cornerRadius := 0.
	thumb := self newThumbElement.
	track := self newTrackElement
]

{ #category : #initialization }
BrHydraSwitchWithTrackLook >> initializeLook [
	super initializeLook.

	self widget
		layout: BlFrameLayout new;
		padding: (BlInsets all: 4);
		border: (BlBorder builder width: 1; build);
		geometry: (BlRectangle new);
		size: 36@14.

	self widget addChildren: { track . thumb }.
	
	self updateColor.
	self updateCornerRadius
]

{ #category : #'instance creation' }
BrHydraSwitchWithTrackLook >> newThumbElement [
	^ BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c frame horizontal weight: 0.5.
			c frame horizontal alignRight ]
]

{ #category : #'instance creation' }
BrHydraSwitchWithTrackLook >> newTrackElement [
	^ BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #'event handling' }
BrHydraSwitchWithTrackLook >> toggleActivated [	
	thumb constraintsDo: [ :c | c frame horizontal alignLeft ]
]

{ #category : #'event handling' }
BrHydraSwitchWithTrackLook >> toggleDeactivated [
	thumb constraintsDo: [ :c | c frame horizontal alignRight ]
]

{ #category : #updating }
BrHydraSwitchWithTrackLook >> updateColor [
	widget border: (widget border copyWithPaint: self color).
	thumb background: self color.
	track background: (self color alpha: 0.3)
]

{ #category : #updating }
BrHydraSwitchWithTrackLook >> updateCornerRadius [
	widget geometry: (BlRectangle cornerRadius: self cornerRadius)
]
