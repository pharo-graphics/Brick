Class {
	#name : #BrSizeState,
	#superclass : #BrInteractionState,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core - States'
}

{ #category : #'instance creation' }
BrSizeState class >> default [
	^ self new dimension: self defaultName
]

{ #category : #accessing }
BrSizeState class >> defaultName [
	^ #default
]

{ #category : #'instance creation' }
BrSizeState class >> huge [
	^ self new dimension: self hugeName
]

{ #category : #accessing }
BrSizeState class >> hugeName [
	^ #huge
]

{ #category : #'instance creation' }
BrSizeState class >> large [
	^ self new dimension: self largeName
]

{ #category : #accessing }
BrSizeState class >> largeName [
	^ #large
]

{ #category : #'instance creation' }
BrSizeState class >> sized: aNamedSize [
	^ BrSizeState new dimension: aNamedSize
]

{ #category : #'instance creation' }
BrSizeState class >> small [
	^ self new dimension: self smallName
]

{ #category : #accessing }
BrSizeState class >> smallName [
	^ #small
]

{ #category : #'instance creation' }
BrSizeState class >> tiny [
	^ self new dimension: self tinyName
]

{ #category : #accessing }
BrSizeState class >> tinyName [
	^ #tiny
]

{ #category : #comparing }
BrSizeState >> = anotherState [
	^ anotherState class = self class
		and: [ anotherState dimension = self dimension ]
]

{ #category : #accessing }
BrSizeState >> dimension [
	^ dimension
]

{ #category : #accessing }
BrSizeState >> dimension: anObject [
	dimension := anObject
]

{ #category : #comparing }
BrSizeState >> hash [
	^ self class hash bitXor: self dimension hash
]

{ #category : #initialization }
BrSizeState >> initialize [
	super initialize.

	dimension := self class defaultName
]
