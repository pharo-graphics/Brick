Class {
	#name : #BrProgressLabelStencil,
	#superclass : #BrStencil,
	#instVars : [
		'amount',
		'total'
	],
	#category : #'Brick-Progress - Model'
}

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

{ #category : #accessing }
BrProgressLabelStencil >> total [
	^ total
]

{ #category : #accessing }
BrProgressLabelStencil >> total: anObject [
	total := anObject
]
