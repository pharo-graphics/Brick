Class {
	#name : #BrSizeAdjustmentSmallState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #printing }
BrSizeAdjustmentSmallState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'small'
]
