"
I am an abstract class. I am a basic ${class:BrProgress}$ look. I listen to progress changes from ${class:BrProgressModel}$ and trigger ${method:BrProgressLook>>#onProgressChanged|label=#selector}$ on progress status changes.

See my subclasses for specific use cases: ${class:BrProgressLook|show=#gtSubclassesFor:|expanded=true|height=200}$


"
Class {
	#name : #BrProgressAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'amount',
		'total'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #accessing }
BrProgressAptitude >> amount [
	^ amount
]

{ #category : #accessing }
BrProgressAptitude >> amount: anAmountNumber total: aTotalNumber [
	self
		assert: [ anAmountNumber notNil and: [ aTotalNumber notNil ] ]
		description: [ 'Progress amount and total numbers must be non-nil' ].
	self
		assert: [ anAmountNumber >= 0 and: [ anAmountNumber <= aTotalNumber ] ]
		description: [ 'Progress amount must be pozitive number less or equal to total number' ].

	amount := anAmountNumber.
	total := aTotalNumber.
	self onProgressChanged
]

{ #category : #'accessing-computed' }
BrProgressAptitude >> fraction [
	^ self amount / self total
]

{ #category : #'instance creation' }
BrProgressAptitude >> fraction: aNumber [
	self 
		assert: [ aNumber notNil ]
		description: [ 'Progress fraction must be non-nil' ].
	self 
		assert: [ aNumber >= 0 and: [ aNumber <= 1 ] ]
		description: [ 'Progress fraction number must be between 0 and 1' ].
	self amount: aNumber * 100 total: 100
]

{ #category : #initialization }
BrProgressAptitude >> initialize [
	super initialize.
	amount := 0.
	total := 100.
]

{ #category : #initialization }
BrProgressAptitude >> initializeListeners [
	super initializeListeners.
	
	self 
		addEventHandlerOn: BrProgressChangedEvent 
		do: [ :anEvent | self amount: anEvent amount total: anEvent total ].
]

{ #category : #initialization }
BrProgressAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrProgressStatusRequest new
]

{ #category : #hooks }
BrProgressAptitude >> onProgressChanged [
	"looks can react to progress changes"
]

{ #category : #'accessing-computed' }
BrProgressAptitude >> percentage [
	^ self amount / self total * 100
]

{ #category : #accessing }
BrProgressAptitude >> percentage: aNumber [
	self amount: aNumber total: 100
]

{ #category : #accessing }
BrProgressAptitude >> total [
	^ total
]
