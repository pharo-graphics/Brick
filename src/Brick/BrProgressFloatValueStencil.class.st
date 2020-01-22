"
I convert ${method:BrProgressModel>>#amount|label=#selector}$ and ${method:BrProgressModel>>#total|label=#selector}$ values to an ${class:Float}$ with a given number of decimals defined using ${method:BrProgressFloatValueStencil>>#numberOfDecimals:|label=#selector}$:

${example:BrProgressExamples>>#floatValues|codeExpanded=false|previewExpanded=true|previewHeight=180}$

"
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
	^ (self value asFloat round: self numberOfDecimals) asString
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
