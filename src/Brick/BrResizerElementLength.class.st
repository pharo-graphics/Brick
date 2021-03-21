Class {
	#name : #BrResizerElementLength,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#category : #'Brick-Resizer - Support'
}

{ #category : #factory }
BrResizerElementLength class >> exact [
	^ BrResizerExactLength new
]

{ #category : #factory }
BrResizerElementLength class >> exact: aNumber [
	^ self exact length: aNumber
]

{ #category : #factory }
BrResizerElementLength class >> weight: aNumber [
	^ self weighted weight: aNumber
]

{ #category : #factory }
BrResizerElementLength class >> weighted [
	^ BrResizerWeightedLength new
]

{ #category : #'api - size' }
BrResizerElementLength >> adjustHeightFor: anElement [
	"Set element height"
	self subclassResponsibility
]

{ #category : #'api - size' }
BrResizerElementLength >> adjustWidthFor: anElement [
	"Set element width"
	self subclassResponsibility
]
