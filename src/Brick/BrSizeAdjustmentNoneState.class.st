Class {
	#name : #BrSizeAdjustmentNoneState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #testing }
BrSizeAdjustmentNoneState >> isNone [
	^ true
]

{ #category : #printing }
BrSizeAdjustmentNoneState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'none'
]
