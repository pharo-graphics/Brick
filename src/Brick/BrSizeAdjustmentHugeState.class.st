Class {
	#name : #BrSizeAdjustmentHugeState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #printing }
BrSizeAdjustmentHugeState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'huge'
]
