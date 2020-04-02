Class {
	#name : #BrSizeAdjustmentRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrSizeAdjustmentRequest >> responseClass [
	^ BrSizeAdjustmentChanged
]
