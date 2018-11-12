Class {
	#name : #BrDimensionState,
	#superclass : #BrInteractionState,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #'instance creation' }
BrDimensionState class >> default [
	^ self new dimension: self defaultName
]

{ #category : #accessing }
BrDimensionState class >> defaultName [
	^ #default
]

{ #category : #'instance creation' }
BrDimensionState class >> huge [
	^ self new dimension: self hugeName
]

{ #category : #accessing }
BrDimensionState class >> hugeName [
	^ #huge
]

{ #category : #'instance creation' }
BrDimensionState class >> large [
	^ self new dimension: self largeName
]

{ #category : #accessing }
BrDimensionState class >> largeName [
	^ #large
]

{ #category : #'instance creation' }
BrDimensionState class >> small [
	^ self new dimension: self smallName
]

{ #category : #accessing }
BrDimensionState class >> smallName [
	^ #small
]

{ #category : #'instance creation' }
BrDimensionState class >> tiny [
	^ self new dimension: self tinyName
]

{ #category : #accessing }
BrDimensionState class >> tinyName [
	^ #tiny
]

{ #category : #comparing }
BrDimensionState >> = anotherState [
	^ anotherState class = self class
		and: [ anotherState dimension = self dimension ]
]

{ #category : #accessing }
BrDimensionState >> dimension [
	^ dimension
]

{ #category : #accessing }
BrDimensionState >> dimension: anObject [
	dimension := anObject
]

{ #category : #comparing }
BrDimensionState >> hash [
	^ self class hash bitXor: self dimension hash
]

{ #category : #initialization }
BrDimensionState >> initialize [
	super initialize.

	dimension := self class defaultName
]
