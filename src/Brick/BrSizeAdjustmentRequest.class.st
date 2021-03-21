Class {
	#name : #BrSizeAdjustmentRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrSizeAdjustmentRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrSizeAdjustmentRequest >> responseClass [
	^ BrSizeAdjustmentChanged
]
