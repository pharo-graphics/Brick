Class {
	#name : #BrProgressFloatValueStencil,
	#superclass : #BrProgressValueStencil,
	#instVars : [
		'numberOfDecimals'
	],
	#category : #'Brick-Progress - Model'
}

{ #category : #'api - instantiation' }
BrProgressFloatValueStencil >> create [
	<return: #String>
	^ self value asFloat round: self numberOfDecimals
]

{ #category : #initialization }
BrProgressFloatValueStencil >> initialize [
	super initialize.
	numberOfDecimals := 2.
]

{ #category : #accessing }
BrProgressFloatValueStencil >> numberOfDecimals [
	<return: #Integer>
	^ numberOfDecimals
]

{ #category : #accessing }
BrProgressFloatValueStencil >> numberOfDecimals: anInteger [
	numberOfDecimals := anInteger
]
