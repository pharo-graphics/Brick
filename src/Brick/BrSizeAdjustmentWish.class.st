Class {
	#name : #BrSizeAdjustmentWish,
	#superclass : #BrWish,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrSizeAdjustmentWish class >> beDefault [
	^ self new dimension: BrSizeAdjustmentState defaultName
]

{ #category : #'instance creation' }
BrSizeAdjustmentWish class >> beHuge [
	^ self new dimension: BrSizeAdjustmentState hugeName
]

{ #category : #'instance creation' }
BrSizeAdjustmentWish class >> beLarge [
	^ self new dimension: BrSizeAdjustmentState largeName
]

{ #category : #'instance creation' }
BrSizeAdjustmentWish class >> beMini [
	^ self new dimension: BrSizeAdjustmentState miniName
]

{ #category : #'instance creation' }
BrSizeAdjustmentWish class >> beSmall [
	^ self new dimension: BrSizeAdjustmentState smallName
]

{ #category : #'instance creation' }
BrSizeAdjustmentWish class >> beTiny [
	^ self new dimension: BrSizeAdjustmentState tinyName
]

{ #category : #accessing }
BrSizeAdjustmentWish >> dimension [
	^ dimension
]

{ #category : #accessing }
BrSizeAdjustmentWish >> dimension: anObject [
	dimension := anObject
]
