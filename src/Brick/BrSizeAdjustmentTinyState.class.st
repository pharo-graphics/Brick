Class {
	#name : #BrSizeAdjustmentTinyState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #printing }
BrSizeAdjustmentTinyState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'tiny'
]
