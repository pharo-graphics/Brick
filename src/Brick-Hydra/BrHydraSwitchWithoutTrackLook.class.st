Class {
	#name : #BrHydraSwitchWithoutTrackLook,
	#superclass : #BrHydraSwitchLook,
	#instVars : [
		'thumb'
	],
	#category : 'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchWithoutTrackLook >> deactivatedColor [
	^ self color alpha: 0.4
]

{ #category : #initialization }
BrHydraSwitchWithoutTrackLook >> initialize [
	super initialize.
	
	thumb := self newThumbElement
]

{ #category : #initialization }
BrHydraSwitchWithoutTrackLook >> initializeLook [
	super initializeLook.

	self widget
		size: 22@14;
		layout: BlFrameLayout new;
		padding: (BlInsets all: 3);
		border: (BlBorder builder width: 1; build);
		geometry: (BlRectangle cornerRadius: 8).

	self widget addChild: thumb.

	self updateColor
]

{ #category : #'instance creation' }
BrHydraSwitchWithoutTrackLook >> newThumbElement [
	^ BlElement new
		geometry: (BlEllipse new);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c frame horizontal weight: 0.5.
			c frame horizontal alignRight ]
]

{ #category : #'event handling' }
BrHydraSwitchWithoutTrackLook >> toggleActivated [	
	thumb constraintsDo: [ :c | c frame horizontal alignLeft ].
	thumb background: self color
]

{ #category : #'event handling' }
BrHydraSwitchWithoutTrackLook >> toggleDeactivated [
	thumb constraintsDo: [ :c | c frame horizontal alignRight ].
	thumb background: (self deactivatedColor)
]

{ #category : #updating }
BrHydraSwitchWithoutTrackLook >> updateColor [
	widget border: (widget border copyWithPaint: self color).

	widget isActivated
		ifTrue: [ thumb background: self color ]
		ifFalse: [ thumb background: self deactivatedColor ]
]
