"
I model a state of the resizer's lcoation.

I am useful to let resizer widgets style themselves based on the location. For example if location is bottom, then widget should look like a horizontal bar. If location is left then resizer should be a vertical bar.
"
Class {
	#name : #BrResizerLocationState,
	#superclass : #BrInteractionState,
	#instVars : [
		'location'
	],
	#category : #'Brick-Resizer - State'
}

{ #category : #accessing }
BrResizerLocationState class >> bottom [
	^ self location: BrResizerBottomLocation new
]

{ #category : #accessing }
BrResizerLocationState class >> left [
	^ self location: BrResizerLeftLocation new
]

{ #category : #'instance creation' }
BrResizerLocationState class >> location: aBrResizerLocation [
	^ self new location: aBrResizerLocation
]

{ #category : #accessing }
BrResizerLocationState class >> right [
	^ self location: BrResizerRightLocation new
]

{ #category : #accessing }
BrResizerLocationState class >> top [
	^ self location: BrResizerTopLocation new
]

{ #category : #comparing }
BrResizerLocationState >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ location = anObject location
]

{ #category : #comparing }
BrResizerLocationState >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash bitXor: location hash
]

{ #category : #accessing }
BrResizerLocationState >> location [
	<return: #BrResizerLocation>

	^ location
]

{ #category : #accessing }
BrResizerLocationState >> location: aBrResizerLocation [
	location := aBrResizerLocation
]
