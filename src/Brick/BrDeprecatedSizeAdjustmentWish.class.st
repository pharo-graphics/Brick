Class {
	#name : #BrDeprecatedSizeAdjustmentWish,
	#superclass : #BrWish,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentWish class >> beDefault [
	^ self new dimension: BrDeprecatedSizeAdjustmentState defaultName
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentWish class >> beHuge [
	^ self new dimension: BrDeprecatedSizeAdjustmentState hugeName
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentWish class >> beLarge [
	^ self new dimension: BrDeprecatedSizeAdjustmentState largeName
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentWish class >> beMini [
	^ self new dimension: BrDeprecatedSizeAdjustmentState miniName
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentWish class >> beSmall [
	^ self new dimension: BrDeprecatedSizeAdjustmentState smallName
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentWish class >> beTiny [
	^ self new dimension: BrDeprecatedSizeAdjustmentState tinyName
]

{ #category : #testing }
BrDeprecatedSizeAdjustmentWish class >> isDeprecated [
	^ true
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentWish >> dimension [
	^ dimension
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentWish >> dimension: anObject [
	dimension := anObject
]
