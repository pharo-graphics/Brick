Class {
	#name : #BrHydraSwitchWithoutTrackAptitude,
	#superclass : #BrHydraSwitchAptitude,
	#instVars : [
		'thumb'
	],
	#category : #'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchWithoutTrackAptitude >> deactivatedColor [
	^ self color alpha: 0.4
]

{ #category : #initialization }
BrHydraSwitchWithoutTrackAptitude >> initialize [
	super initialize.
	thumb := self newThumbElement.
	self addChangeProperty: #(widget layout) with: [ BlFrameLayout new ].
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 3 ].
	self
		addChangeProperty: #(widget border)
		with: [ :e | e copyWithWidth: 1 ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRoundedRectangleGeometry cornerRadius: 8 ].
	self addChangeAddChildAs: #(content thumb) with: [ thumb ].
	self addChangeProperty: #(widget size) with: [ 36 @ 20 ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateColor ];
				down: [ :e |  ];
				yourself)
]

{ #category : #'instance creation' }
BrHydraSwitchWithoutTrackAptitude >> newThumbElement [
	^ BlElement new
		geometry: (BlEllipseGeometry new);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c frame horizontal weight: 0.5.
			c frame horizontal alignRight ]
]

{ #category : #'event handling' }
BrHydraSwitchWithoutTrackAptitude >> toggleActivated [	
	thumb constraintsDo: [ :c | c frame horizontal alignLeft ].
	thumb background: self color
]

{ #category : #'event handling' }
BrHydraSwitchWithoutTrackAptitude >> toggleDeactivated [
	thumb constraintsDo: [ :c | c frame horizontal alignRight ].
	thumb background: (self deactivatedColor)
]

{ #category : #updating }
BrHydraSwitchWithoutTrackAptitude >> updateColor [
	widget border: (widget border copyWithPaint: self color).

	widget isActivated
		ifTrue: [ thumb background: self color ]
		ifFalse: [ thumb background: self deactivatedColor ]
]
