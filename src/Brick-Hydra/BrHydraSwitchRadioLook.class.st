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
	thumb := self newThumbElement.
	self addChangeProperty: #(widget layout) with: [ BlFrameLayout new ].
	self addChangeProperty: #(widget padding) with: [ BlInsets all: 3 ].
	self
		addChangeProperty: #(widget border)
		with: [ :e | e copyWithWidth: 1 ].
	self addChangeProperty: #(widget geometry) with: [ BlEllipse new ].
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
