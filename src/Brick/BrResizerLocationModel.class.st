Class {
	#name : #BrResizerLocationModel,
	#superclass : #BrStateModel,
	#instVars : [
		'location'
	],
	#category : #'Brick-Resizer - State'
}

{ #category : #location }
BrResizerLocationModel >> beBottom [
	self location: BrResizerBottomLocation new
]

{ #category : #location }
BrResizerLocationModel >> beLeft [
	self location: BrResizerLeftLocation new
]

{ #category : #location }
BrResizerLocationModel >> beRight [
	self location: BrResizerRightLocation new
]

{ #category : #location }
BrResizerLocationModel >> beTop [
	self location: BrResizerTopLocation new
]

{ #category : #initialization }
BrResizerLocationModel >> initialize [
	super initialize.
	
	self beBottom
]

{ #category : #initialization }
BrResizerLocationModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrResizerLocationRequest reply: [ :anEvent | anEvent location: self location ]
]

{ #category : #accessing }
BrResizerLocationModel >> location [
	<return: #BrResizerLocation>

	^ location
]

{ #category : #accessing }
BrResizerLocationModel >> location: aLocation [
	location = aLocation
		ifTrue: [ ^ self ].

	location := aLocation.
	self notifyStateChanged: aLocation
]

{ #category : #'state - accessing' }
BrResizerLocationModel >> stateChangedEventClass [
	^ BrResizerLocationChanged
]

{ #category : #'state - streaming' }
BrResizerLocationModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (BrResizerLocationState location: self location)
		model: self
]
