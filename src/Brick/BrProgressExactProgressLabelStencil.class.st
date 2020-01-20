Class {
	#name : #BrProgressExactProgressLabelStencil,
	#superclass : #BrProgressLabelStencil,
	#instVars : [
		'pattern'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #'api - instantiation' }
BrProgressExactProgressLabelStencil >> create [
	<return: #BlRopedText>
	^ (self pattern format: { self amount. self total }) asRopedText
]

{ #category : #accessing }
BrProgressExactProgressLabelStencil >> pattern [
	^ pattern
]

{ #category : #accessing }
BrProgressExactProgressLabelStencil >> pattern: anObject [
	pattern := anObject
]
