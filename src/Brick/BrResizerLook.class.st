Class {
	#name : #BrResizerLook,
	#superclass : #BrLook,
	#instVars : [
		'resizerListener',
		'location',
		'target'
	],
	#category : #'Brick-Resizer - Look'
}

{ #category : #initialization }
BrResizerLook >> initialize [
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
BrResizerLook >> initializeListeners [
	super initializeListeners.

	self when: BrResizerLocationChanged do: [ :anEvent | self location: anEvent location ].
	self when: BrResizerTargetChanged do: [ :anEvent | self target: anEvent targetElement ]
]

{ #category : #initialization }
BrResizerLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrResizerLocationRequest new.
	self request: BrResizerTargetRequest new
]

{ #category : #accessing }
BrResizerLook >> location [
	^ location
]

{ #category : #accessing }
BrResizerLook >> location: aBrResizerLocation [
	"When location changes we should recreate an event listener"

	location := aBrResizerLocation.
	self updateListener
]

{ #category : #accessing }
BrResizerLook >> target [
	^ target
]

{ #category : #accessing }
BrResizerLook >> target: anElement [
	target := anElement.
	resizerListener resizeTarget: self target
]

{ #category : #private }
BrResizerLook >> updateListener [
	self widgetDo: [ :aWidget | aWidget removeEventHandler: resizerListener ].

	resizerListener := self location newResizerListener.
	resizerListener resizeTarget: self target.

	self widgetDo: [ :aWidget | aWidget addEventHandler: resizerListener ]
]
