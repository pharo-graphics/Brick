Class {
	#name : #BrSizeAdjustmentLargeState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #printing }
BrSizeAdjustmentLargeState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'large'
]
