"
I inform about progress status changes. I am triggered by ${class:BrProgressModel}$ and received by ${class:BrProgressLook}$.

"
Class {
	#name : #BrProgressChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'amount',
		'total'
	],
	#category : #'Brick-Progress - Events'
}

{ #category : #accessing }
BrProgressChangedEvent class >> amount: anAmountNumber total: aTotalNumber [
	^ self new
		amount: anAmountNumber;
		total: aTotalNumber.
]

{ #category : #accessing }
BrProgressChangedEvent >> amount [
	^ amount
]

{ #category : #accessing }
BrProgressChangedEvent >> amount: anObject [
	amount := anObject
]

{ #category : #initialization }
BrProgressChangedEvent >> initialize [
	super initialize.
	amount := 0.
	total := 100.
]

{ #category : #accessing }
BrProgressChangedEvent >> total [
	^ total
]

{ #category : #accessing }
BrProgressChangedEvent >> total: anObject [
	total := anObject
]
