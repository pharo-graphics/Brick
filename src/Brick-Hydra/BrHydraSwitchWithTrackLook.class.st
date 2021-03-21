Class {
	#name : #BrHydraSwitchWithTrackLook,
	#superclass : #BrHydraSwitchLook,
	#instVars : [
		'track',
		'thumb',
		'cornerRadius'
	],
	#category : #'Brick-Hydra'
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
	self addChangeProperty: #(widget layout) with: [ BlFrameLayout new ].
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 4 ].
	self
		addChangeProperty: #(widget border)
		with: [ :e | e copyWithWidth: 1 ].
	self addChangeProperty: #(widget geometry) with: [ BlRectangleGeometry new ].
	self addChangeProperty: #(widget size) with: [ 48 @ 18 ].
	self addChangeAddChildAs: #(track) with: [ track ].
	self addChangeAddChildAs: #(thumb) with: [ thumb ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self updateColor.
					self updateCornerRadius ];
				down: [ :e |  ];
				yourself)
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
	widget geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius)
]
