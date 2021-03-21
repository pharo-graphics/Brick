Class {
	#name : #BrSizeAdjustmentLook,
	#superclass : #BrStyleLook,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #accessing }
BrSizeAdjustmentLook >> huge [
	^ self styleFor: BrSizeAdjustmentState huge
]

{ #category : #accessing }
BrSizeAdjustmentLook >> huge: aBlock [
	aBlock value: self huge
]

{ #category : #accessing }
BrSizeAdjustmentLook >> large [
	^ self styleFor: BrSizeAdjustmentState large
]

{ #category : #accessing }
BrSizeAdjustmentLook >> large: aBlock [
	aBlock value: self large
]

{ #category : #accessing }
BrSizeAdjustmentLook >> mini [
	^ self styleFor: BrSizeAdjustmentState mini
]

{ #category : #accessing }
BrSizeAdjustmentLook >> mini: aBlock [
	aBlock value: self mini
]

{ #category : #accessing }
BrSizeAdjustmentLook >> normal [
	^ self styleFor: BrSizeAdjustmentState normal
]

{ #category : #accessing }
BrSizeAdjustmentLook >> normal: aBlock [
	aBlock value: self normal
]

{ #category : #accessing }
BrSizeAdjustmentLook >> small [
	^ self styleFor: BrSizeAdjustmentState small
]

{ #category : #accessing }
BrSizeAdjustmentLook >> small: aBlock [
	aBlock value: self small
]

{ #category : #accessing }
BrSizeAdjustmentLook >> tiny [
	^ self styleFor: BrSizeAdjustmentState tiny
]

{ #category : #accessing }
BrSizeAdjustmentLook >> tiny: aBlock [
	aBlock value: self tiny
]
