Class {
	#name : #BrSizeAdjustmentState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-! Core - Size Adjustment'
}

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> huge [
	^ BrSizeAdjustmentHugeState uniqueInstance
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> large [
	^ BrSizeAdjustmentLargeState uniqueInstance
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> mini [
	^ BrSizeAdjustmentMiniState uniqueInstance
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> none [
	^ BrSizeAdjustmentNoneState uniqueInstance
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> normal [
	^ BrSizeAdjustmentNormalState uniqueInstance
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> small [
	^ BrSizeAdjustmentSmallState uniqueInstance
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> tiny [
	^ BrSizeAdjustmentTinyState uniqueInstance
]

{ #category : #testing }
BrSizeAdjustmentState >> isNone [
	^ false
]

{ #category : #printing }
BrSizeAdjustmentState >> printOn: aStream [
	aStream nextPutAll: 'size adjustment - '
]

{ #category : #accessing }
BrSizeAdjustmentState >> priority [
	^ UserPriority
]

{ #category : #testing }
BrSizeAdjustmentState >> shouldPropagateToChildren [
	^ true
]

{ #category : #accessing }
BrSizeAdjustmentState >> type [
	"Return an object used to compare two states when adding to the collection of states in order to prevent
	elements from having duplicated states"
	<return: #Object>

	^ BrSizeAdjustmentState
]
