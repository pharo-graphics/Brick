Class {
	#name : #BrSizeAdjustmentAptitude,
	#superclass : #BrStyleAptitude,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #accessing }
BrSizeAdjustmentAptitude >> huge [
	^ self styleFor: BrSizeAdjustmentState huge
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> huge: aBlock [
	aBlock value: self huge
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> large [
	^ self styleFor: BrSizeAdjustmentState large
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> large: aBlock [
	aBlock value: self large
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> mini [
	^ self styleFor: BrSizeAdjustmentState mini
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> mini: aBlock [
	aBlock value: self mini
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> normal [
	^ self styleFor: BrSizeAdjustmentState normal
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> normal: aBlock [
	aBlock value: self normal
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> small [
	^ self styleFor: BrSizeAdjustmentState small
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> small: aBlock [
	aBlock value: self small
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> tiny [
	^ self styleFor: BrSizeAdjustmentState tiny
]

{ #category : #accessing }
BrSizeAdjustmentAptitude >> tiny: aBlock [
	aBlock value: self tiny
]
