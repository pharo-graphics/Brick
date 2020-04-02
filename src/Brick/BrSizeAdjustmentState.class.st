Class {
	#name : #BrSizeAdjustmentState,
	#superclass : #BrInteractionState,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> default [
	^ self new dimension: self defaultName
]

{ #category : #accessing }
BrSizeAdjustmentState class >> defaultName [
	^ #default
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> huge [
	^ self new dimension: self hugeName
]

{ #category : #accessing }
BrSizeAdjustmentState class >> hugeName [
	^ #huge
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> large [
	^ self new dimension: self largeName
]

{ #category : #accessing }
BrSizeAdjustmentState class >> largeName [
	^ #large
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> mini [
	^ self new dimension: self miniName
]

{ #category : #accessing }
BrSizeAdjustmentState class >> miniName [
	^ #mini
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> sized: aNamedSize [
	^ BrSizeAdjustmentState new dimension: aNamedSize
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> small [
	^ self new dimension: self smallName
]

{ #category : #accessing }
BrSizeAdjustmentState class >> smallName [
	^ #small
]

{ #category : #'instance creation' }
BrSizeAdjustmentState class >> tiny [
	^ self new dimension: self tinyName
]

{ #category : #accessing }
BrSizeAdjustmentState class >> tinyName [
	^ #tiny
]

{ #category : #comparing }
BrSizeAdjustmentState >> = anotherState [
	^ anotherState class = self class
		and: [ anotherState dimension = self dimension ]
]

{ #category : #accessing }
BrSizeAdjustmentState >> dimension [
	^ dimension
]

{ #category : #accessing }
BrSizeAdjustmentState >> dimension: anObject [
	dimension := anObject
]

{ #category : #comparing }
BrSizeAdjustmentState >> hash [
	^ self class hash bitXor: self dimension hash
]

{ #category : #initialization }
BrSizeAdjustmentState >> initialize [
	super initialize.

	dimension := self class defaultName
]
