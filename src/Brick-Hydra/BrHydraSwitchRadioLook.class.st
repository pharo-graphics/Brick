Class {
	#name : #BrHydraSwitchRadioLook,
	#superclass : #BrHydraSwitchLook,
	#instVars : [
		'thumb'
	],
	#category : 'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchRadioLook >> deactivatedColor [
	^ self color alpha: 0.4
]

{ #category : #initialization }
BrHydraSwitchRadioLook >> initialize [
	super initialize.
	
	thumb := self newThumbElement
]

{ #category : #initialization }
BrHydraSwitchRadioLook >> initializeLook [
	super initializeLook.

	self widget
		size: 14@14;
		layout: BlFrameLayout new;
		padding: (BlInsets all: 3);
		border: (BlBorder builder width: 1; build);
		geometry: BlEllipse new.

	self widget addChild: thumb.

	self updateColor
]

{ #category : #'instance creation' }
BrHydraSwitchRadioLook >> newThumbElement [
	^ BlElement new
		geometry: BlEllipse new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #'event handling' }
BrHydraSwitchRadioLook >> toggleActivated [
	thumb background: self color
]

{ #category : #'event handling' }
BrHydraSwitchRadioLook >> toggleDeactivated [
	thumb background: self deactivatedColor
]

{ #category : #updating }
BrHydraSwitchRadioLook >> updateColor [
	widget border: (widget border copyWithPaint: self color).

	widget isActivated
		ifTrue: [ thumb background: self color ]
		ifFalse: [ thumb background: self deactivatedColor ]
]
