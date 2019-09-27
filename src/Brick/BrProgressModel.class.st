Class {
	#name : #BrProgressModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'amount',
		'total'
	],
	#category : 'Brick-Progress - Model'
}

{ #category : #accessing }
BrProgressModel >> amount [
	<return: #Number>
	^ amount
]

{ #category : #accessing }
BrProgressModel >> amount: anAmountNumber total: aTotalNumber [
	self
		assert: [ anAmountNumber notNil and: [ aTotalNumber notNil ] ]
		description: [ 'Progress amount and total numbers must be non-nil' ].
	self
		assert: [ anAmountNumber >= 0 and: [ anAmountNumber <= aTotalNumber ] ]
		description: [ 'Progress amount must be pozitive number less or equal to total number' ].

	amount := anAmountNumber.
	total := aTotalNumber.
	self onProgressChanged: anAmountNumber total: aTotalNumber.
]

{ #category : #accessing }
BrProgressModel >> fraction [
	^ self amount / self total
]

{ #category : #accessing }
BrProgressModel >> fraction: aNumber [
	self 
		assert: [ aNumber notNil ]
		description: [ 'Progress fraction must be non-nil' ].
	self 
		assert: [ aNumber >= 0 and: [ aNumber <= 1 ] ]
		description: [ 'Progress fraction number must be between 0 and 1' ].
	self amount: aNumber * 100 total: 100
]

{ #category : #initialization }
BrProgressModel >> initialize [
	super initialize.
	amount := 0.
	total := 100.
]

{ #category : #notifying }
BrProgressModel >> notifyProgressChanged: anAmountNumber total: aTotalNumber [
	self dispatchEvent: (BrProgressChangedEvent amount: anAmountNumber total: aTotalNumber)
]

{ #category : #hooks }
BrProgressModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	self 
		when: BrProgressStatusRequest 
		reply: [ BrProgressChangedEvent amount: self amount total: self total ]
]

{ #category : #hooks }
BrProgressModel >> onProgressChanged: anAmountNumber total: aTotalNumber [
	self notifyProgressChanged: anAmountNumber total: aTotalNumber.
]

{ #category : #accessing }
BrProgressModel >> percentage [
	^ self amount / self total * 100
]

{ #category : #accessing }
BrProgressModel >> percentage: aNumber [
	self amount: aNumber total: 100
]

{ #category : #accessing }
BrProgressModel >> total [
	<return: #Number>
	^ total
]
