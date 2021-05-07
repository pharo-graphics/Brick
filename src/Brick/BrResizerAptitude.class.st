Class {
	#name : #BrResizerAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'resizerListener',
		'location',
		'target'
	],
	#category : #'Brick-Resizer - Look'
}

{ #category : #initialization }
BrResizerAptitude >> initialize [
	super initialize.
	location := BrResizerBottomLocation new.
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateListener ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrResizerAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrResizerLocationChanged do: [ :anEvent | self location: anEvent location ].
	self when: BrResizerTargetChanged do: [ :anEvent | self target: anEvent targetElement ]
]

{ #category : #initialization }
BrResizerAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrResizerLocationRequest new.
	self request: BrResizerTargetRequest new
]

{ #category : #accessing }
BrResizerAptitude >> location [
	^ location
]

{ #category : #accessing }
BrResizerAptitude >> location: aBrResizerLocation [
	"When location changes we should recreate an event listener"

	location := aBrResizerLocation.
	self updateListener
]

{ #category : #accessing }
BrResizerAptitude >> target [
	^ target
]

{ #category : #accessing }
BrResizerAptitude >> target: anElement [
	target := anElement.
	resizerListener resizeTarget: self target
]

{ #category : #private }
BrResizerAptitude >> updateListener [
	self widgetDo: [ :aWidget | aWidget removeEventHandler: resizerListener ].

	resizerListener := self location newResizerListener.
	resizerListener resizeTarget: self target.

	self widgetDo: [ :aWidget | aWidget addEventHandler: resizerListener ]
]
