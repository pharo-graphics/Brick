"
My subclasses create a specific progress label content (string).

See my subclasses for specific examples: ${class:BrProgressLabelStencil|show=#gtSubclassesFor:|expanded=true|height=150}$

"
Class {
	#name : #BrProgressLabelStencil,
	#superclass : #BrStencil,
	#instVars : [
		'amount',
		'total'
	],
	#category : #'Brick-Progress - Model'
}

{ #category : #testing }
BrProgressLabelStencil class >> isAbstract [
	^ self name = #BrProgressLabelStencil 
]

{ #category : #accessing }
BrProgressLabelStencil >> amount [
	^ amount
]

{ #category : #accessing }
BrProgressLabelStencil >> amount: anObject [
	amount := anObject
]

{ #category : #'api - instantiation' }
BrProgressLabelStencil >> create [
	<return: #BlRopedText>
	^ self subclassResponsibility
]

{ #category : #initialization }
BrProgressLabelStencil >> initialize [
	super initialize.
	amount := 0.
	total := 100.
]

{ #category : #accessing }
BrProgressLabelStencil >> total [
	^ total
]

{ #category : #accessing }
BrProgressLabelStencil >> total: anObject [
	total := anObject
]
