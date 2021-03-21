Class {
	#name : #BrDeprecatedSizeAdjustmentState,
	#superclass : #BrInteractionState,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> default [
	^ self new dimension: self defaultName
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState class >> defaultName [
	^ #default
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> huge [
	^ self new dimension: self hugeName
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState class >> hugeName [
	^ #huge
]

{ #category : #testing }
BrDeprecatedSizeAdjustmentState class >> isDeprecated [
	^ true
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> large [
	^ self new dimension: self largeName
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState class >> largeName [
	^ #large
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> mini [
	^ self new dimension: self miniName
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState class >> miniName [
	^ #mini
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> sized: aNamedSize [
	^ BrDeprecatedSizeAdjustmentState new dimension: aNamedSize
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> small [
	^ self new dimension: self smallName
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState class >> smallName [
	^ #small
]

{ #category : #'instance creation' }
BrDeprecatedSizeAdjustmentState class >> tiny [
	^ self new dimension: self tinyName
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState class >> tinyName [
	^ #tiny
]

{ #category : #comparing }
BrDeprecatedSizeAdjustmentState >> = anotherState [
	^ anotherState class = self class
		and: [ anotherState dimension = self dimension ]
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState >> dimension [
	^ dimension
]

{ #category : #accessing }
BrDeprecatedSizeAdjustmentState >> dimension: anObject [
	dimension := anObject
]

{ #category : #comparing }
BrDeprecatedSizeAdjustmentState >> hash [
	^ self class hash bitXor: self dimension hash
]

{ #category : #initialization }
BrDeprecatedSizeAdjustmentState >> initialize [
	super initialize.

	dimension := self class defaultName
]
