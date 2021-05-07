Class {
	#name : #BrHydraSwitchRadioAptitude,
	#superclass : #BrHydraSwitchAptitude,
	#instVars : [
		'thumb'
	],
	#category : #'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchRadioAptitude >> deactivatedColor [
	^ self color alpha: 0.4
]

{ #category : #initialization }
BrHydraSwitchRadioAptitude >> initialize [
	super initialize.
	thumb := self newThumbElement.
	self addChangeProperty: #(widget layout) with: [ BlFrameLayout new ].
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 3 ].
	self
		addChangeProperty: #(widget border)
		with: [ :e | e copyWithWidth: 1 ].
	self addChangeProperty: #(widget geometry) with: [ BlEllipseGeometry new ].
	self addChangeAddChildAs: #(content thumb) with: [ thumb ].
	self addChangeProperty: #(widget size) with: [ 20 @ 20 ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateColor ];
				down: [ :e |  ];
				yourself)
]

{ #category : #'instance creation' }
BrHydraSwitchRadioAptitude >> newThumbElement [
	^ BlElement new
		geometry: BlEllipseGeometry new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #'event handling' }
BrHydraSwitchRadioAptitude >> toggleActivated [
	thumb background: self color
]

{ #category : #'event handling' }
BrHydraSwitchRadioAptitude >> toggleDeactivated [
	thumb background: self deactivatedColor
]

{ #category : #updating }
BrHydraSwitchRadioAptitude >> updateColor [
	widget border: (widget border copyWithPaint: self color).

	widget isActivated
		ifTrue: [ thumb background: self color ]
		ifFalse: [ thumb background: self deactivatedColor ]
]
