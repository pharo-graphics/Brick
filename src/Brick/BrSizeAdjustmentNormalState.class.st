Class {
	#name : #BrSizeAdjustmentNormalState,
	#superclass : #BrSizeAdjustmentState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #printing }
BrSizeAdjustmentNormalState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPutAll: 'normal'
]
