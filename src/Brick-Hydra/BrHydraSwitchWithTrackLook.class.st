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
	track := self newTrackElement.
	changes
		add:
			(#(widget layout)
				asBrLookPropertyChangeWithValue: [ BlFrameLayout new ]).
	changes
		add:
			(#(widget padding)
				asBrLookPropertyChangeWithValue: [ BlInsets all: 4 ]).
	changes
		add:
			(#(widget border)
				asBrLookPropertyChangeWithValue: [ BlBorder builder
						width: 1;
						build ]).
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle new ]).
	changes
		add: (#(widget size) asBrLookPropertyChangeWithValue: [ 48 @ 18 ]).
	changes add: (#(track) asBrLookChildAddAsChangeWithValue: [ track ]).
	changes add: (#(thumb) asBrLookChildAddAsChangeWithValue: [ thumb ])
]

{ #category : #initialization }
BrHydraSwitchWithTrackLook >> initializeLook [
	super initializeLook.
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
