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
	thumb := self newThumbElement.
	changes
		add:
			(#(widget layout)
				asBrLookPropertyChangeWithValue: [ BlFrameLayout new ]).
	changes
		add:
			(#(widget padding)
				asBrLookPropertyChangeWithValue: [ BlInsets all: 3 ]).
	changes
		add:
			(#(widget border)
				asBrLookPropertyChangeWithValue: [ :e | e copyWithWidth: 1 ]).
	changes
		add:
			(#(widget geometry)
				asBrLookPropertyChangeWithValue: [ BlRectangle cornerRadius: 8 ]).
	changes
		add: (#(content thumb) asBrLookChildAddAsChangeWithValue: [ thumb ]).
	changes
		add: (#(widget size) asBrLookPropertyChangeWithValue: [ 36 @ 20 ]).
	changes
		add:
			(BrLookChange new
				up: [ :e | self updateColor ];
				down: [ :e |  ];
				yourself)
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
