Class {
	#name : #BrResizerExactLength,
	#superclass : #BrResizerElementLength,
	#instVars : [
		'length'
	],
	#category : #'Brick-Resizer - Support'
}

{ #category : #'api - size' }
BrResizerExactLength >> adjustHeightFor: anElement [
	"Set element height"
	anElement height: self length.
	anElement states addState: BrLayoutVerticalResizerState exact
]

{ #category : #'api - size' }
BrResizerExactLength >> adjustWidthFor: anElement [
	"Set element width"
	anElement width: self length.

	anElement states addState: BrLayoutHorizontalResizerState exact.
]

{ #category : #asserting }
BrResizerExactLength >> assertLength: aNumber [
	self 
		assert: [ aNumber isNotNil ] 
		description: [ 'Exact width must be non-nil' ].
	self
		assert: [ aNumber >= 0 ]
		description: [ 'Exact width must be non-negative' ].
]

{ #category : #accessing }
BrResizerExactLength >> defaultLength [
	^ 400
]

{ #category : #initialization }
BrResizerExactLength >> initialize [
	super initialize.
	length := self defaultLength.
]

{ #category : #accessing }
BrResizerExactLength >> length [
	<return: #Number>
	^ length
]

{ #category : #accessing }
BrResizerExactLength >> length: aNumber [
	self assertLength: aNumber.
	length := aNumber
]

{ #category : #printing }
BrResizerExactLength >> printOn: aStream [ 
	aStream nextPutAll: 'Exact width: '; print: self width
]
