Class {
	#name : #BrProgressFixedLabelStencil,
	#superclass : #BrProgressLabelStencil,
	#instVars : [
		'label'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #'api - instantiation' }
BrProgressFixedLabelStencil >> create [
	<return: #BlRopedText>
	^ self label
]

{ #category : #initialization }
BrProgressFixedLabelStencil >> initialize [
	super initialize.
	self label: 'Label'.
]

{ #category : #accessing }
BrProgressFixedLabelStencil >> label [
	<return: #BlRopedText>
	^ label
]

{ #category : #accessing }
BrProgressFixedLabelStencil >> label: aStringOrText [
	label := aStringOrText asRopedText
]
