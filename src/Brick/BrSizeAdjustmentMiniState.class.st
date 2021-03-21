Class {
	#name : #BrSizeAdjustmentMiniState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #printing }
BrSizeAdjustmentMiniState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'mini'
]
